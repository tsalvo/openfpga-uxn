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
-- Submodules: 65
entity equ_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_7c2e709f;
architecture arch of equ_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1092_c6_8963]
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1092_c1_5be1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal t8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1092_c2_9b70]
signal n8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1093_c3_eeb5[uxn_opcodes_h_l1093_c3_eeb5]
signal printf_uxn_opcodes_h_l1093_c3_eeb5_uxn_opcodes_h_l1093_c3_eeb5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1098_c11_c026]
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1098_c7_bbdd]
signal n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_b3b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1101_c7_721d]
signal t8_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_721d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_721d]
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_721d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_721d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_721d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_721d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1101_c7_721d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1101_c7_721d]
signal n8_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_3306]
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1105_c7_d86e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_d86e]
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1105_c7_d86e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_d86e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_d86e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_d86e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1105_c7_d86e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1105_c7_d86e]
signal n8_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1108_c11_eb25]
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1108_c7_446f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1108_c7_446f]
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1108_c7_446f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1108_c7_446f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1108_c7_446f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1108_c7_446f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1108_c7_446f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1108_c7_446f]
signal n8_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1112_c32_1071]
signal BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1112_c32_6656]
signal BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1112_c32_e1af]
signal MUX_uxn_opcodes_h_l1112_c32_e1af_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1112_c32_e1af_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1112_c32_e1af_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1112_c32_e1af_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1114_c11_3c6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1114_c7_6e63]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1114_c7_6e63]
signal result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1114_c7_6e63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1114_c7_6e63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1114_c7_6e63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1118_c24_724b]
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1118_c24_c5fc]
signal MUX_uxn_opcodes_h_l1118_c24_c5fc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1118_c24_c5fc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1118_c24_c5fc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1118_c24_c5fc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1120_c11_b234]
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1120_c7_3bb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1120_c7_3bb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963
BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_left,
BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_right,
BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_return_output);

-- t8_MUX_uxn_opcodes_h_l1092_c2_9b70
t8_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
t8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70
result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70
result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- n8_MUX_uxn_opcodes_h_l1092_c2_9b70
n8_MUX_uxn_opcodes_h_l1092_c2_9b70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond,
n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue,
n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse,
n8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

-- printf_uxn_opcodes_h_l1093_c3_eeb5_uxn_opcodes_h_l1093_c3_eeb5
printf_uxn_opcodes_h_l1093_c3_eeb5_uxn_opcodes_h_l1093_c3_eeb5 : entity work.printf_uxn_opcodes_h_l1093_c3_eeb5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1093_c3_eeb5_uxn_opcodes_h_l1093_c3_eeb5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_left,
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_right,
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output);

-- t8_MUX_uxn_opcodes_h_l1098_c7_bbdd
t8_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd
result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- n8_MUX_uxn_opcodes_h_l1098_c7_bbdd
n8_MUX_uxn_opcodes_h_l1098_c7_bbdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond,
n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue,
n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse,
n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output);

-- t8_MUX_uxn_opcodes_h_l1101_c7_721d
t8_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
t8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
t8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
t8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- n8_MUX_uxn_opcodes_h_l1101_c7_721d
n8_MUX_uxn_opcodes_h_l1101_c7_721d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1101_c7_721d_cond,
n8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue,
n8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse,
n8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_left,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_right,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e
result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output);

-- n8_MUX_uxn_opcodes_h_l1105_c7_d86e
n8_MUX_uxn_opcodes_h_l1105_c7_d86e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1105_c7_d86e_cond,
n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue,
n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse,
n8_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_left,
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_right,
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_return_output);

-- n8_MUX_uxn_opcodes_h_l1108_c7_446f
n8_MUX_uxn_opcodes_h_l1108_c7_446f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1108_c7_446f_cond,
n8_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue,
n8_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse,
n8_MUX_uxn_opcodes_h_l1108_c7_446f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071
BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_left,
BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_right,
BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656
BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_left,
BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_right,
BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_return_output);

-- MUX_uxn_opcodes_h_l1112_c32_e1af
MUX_uxn_opcodes_h_l1112_c32_e1af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1112_c32_e1af_cond,
MUX_uxn_opcodes_h_l1112_c32_e1af_iftrue,
MUX_uxn_opcodes_h_l1112_c32_e1af_iffalse,
MUX_uxn_opcodes_h_l1112_c32_e1af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a
BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63
result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63
result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_cond,
result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b
BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_left,
BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_right,
BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_return_output);

-- MUX_uxn_opcodes_h_l1118_c24_c5fc
MUX_uxn_opcodes_h_l1118_c24_c5fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1118_c24_c5fc_cond,
MUX_uxn_opcodes_h_l1118_c24_c5fc_iftrue,
MUX_uxn_opcodes_h_l1118_c24_c5fc_iffalse,
MUX_uxn_opcodes_h_l1118_c24_c5fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_left,
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_right,
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_return_output,
 t8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 n8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output,
 t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output,
 t8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 n8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output,
 n8_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_return_output,
 n8_MUX_uxn_opcodes_h_l1108_c7_446f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_return_output,
 MUX_uxn_opcodes_h_l1112_c32_e1af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_return_output,
 MUX_uxn_opcodes_h_l1118_c24_c5fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_1110 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1093_c3_eeb5_uxn_opcodes_h_l1093_c3_eeb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6ffd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_5100 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_e31d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1117_c3_851d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1114_l1105_l1101_l1098_l1092_DUPLICATE_7c90_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_DUPLICATE_189e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1101_l1105_l1098_l1108_DUPLICATE_b365_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1114_l1108_DUPLICATE_3b36_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1125_l1088_DUPLICATE_5e6e_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_e31d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_e31d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_1110 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_1110;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1117_c3_851d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1117_c3_851d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6ffd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6ffd;
     VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_5100 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1103_c3_5100;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1114_l1105_l1101_l1098_l1092_DUPLICATE_7c90 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1114_l1105_l1101_l1098_l1092_DUPLICATE_7c90_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1098_c11_c026] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_left;
     BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output := BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1112_c32_1071] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_left;
     BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_return_output := BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_b3b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1120_c11_b234] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_left;
     BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_return_output := BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1101_l1105_l1098_l1108_DUPLICATE_b365 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1101_l1105_l1098_l1108_DUPLICATE_b365_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1118_c24_724b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1114_l1108_DUPLICATE_3b36 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1114_l1108_DUPLICATE_3b36_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_DUPLICATE_189e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_DUPLICATE_189e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1114_c11_3c6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_3306] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_left;
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output := BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1092_c6_8963] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_left;
     BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output := BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1108_c11_eb25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1112_c32_1071_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c6_8963_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_c026_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_b3b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_3306_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_eb25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1114_c11_3c6a_return_output;
     VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c24_724b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_b234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_DUPLICATE_189e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_DUPLICATE_189e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_DUPLICATE_189e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_DUPLICATE_189e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_DUPLICATE_189e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1120_DUPLICATE_8f5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1114_l1105_l1101_l1098_l1092_DUPLICATE_7c90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1114_l1105_l1101_l1098_l1092_DUPLICATE_7c90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1114_l1105_l1101_l1098_l1092_DUPLICATE_7c90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1114_l1105_l1101_l1098_l1092_DUPLICATE_7c90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1114_l1105_l1101_l1098_l1092_DUPLICATE_7c90_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1101_l1105_l1098_l1108_DUPLICATE_b365_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1101_l1105_l1098_l1108_DUPLICATE_b365_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1101_l1105_l1098_l1108_DUPLICATE_b365_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1101_l1105_l1098_l1108_DUPLICATE_b365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1108_l1105_l1101_l1098_l1092_l1120_DUPLICATE_a94d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1114_l1108_DUPLICATE_3b36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1114_l1108_DUPLICATE_3b36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1114_l1108_l1105_l1101_l1098_l1092_DUPLICATE_ec38_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1108_c7_446f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1112_c32_6656] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_left;
     BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_return_output := BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_return_output;

     -- MUX[uxn_opcodes_h_l1118_c24_c5fc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1118_c24_c5fc_cond <= VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_cond;
     MUX_uxn_opcodes_h_l1118_c24_c5fc_iftrue <= VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_iftrue;
     MUX_uxn_opcodes_h_l1118_c24_c5fc_iffalse <= VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_return_output := MUX_uxn_opcodes_h_l1118_c24_c5fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1114_c7_6e63] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1114_c7_6e63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1120_c7_3bb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1092_c1_5be1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1108_c7_446f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1108_c7_446f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_cond;
     n8_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue;
     n8_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_return_output := n8_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     t8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     t8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := t8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1120_c7_3bb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1112_c32_6656_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue := VAR_MUX_uxn_opcodes_h_l1118_c24_c5fc_return_output;
     VAR_printf_uxn_opcodes_h_l1093_c3_eeb5_uxn_opcodes_h_l1093_c3_eeb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1092_c1_5be1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_3bb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1114_c7_6e63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;

     -- t8_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- MUX[uxn_opcodes_h_l1112_c32_e1af] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1112_c32_e1af_cond <= VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_cond;
     MUX_uxn_opcodes_h_l1112_c32_e1af_iftrue <= VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_iftrue;
     MUX_uxn_opcodes_h_l1112_c32_e1af_iffalse <= VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_return_output := MUX_uxn_opcodes_h_l1112_c32_e1af_return_output;

     -- n8_MUX[uxn_opcodes_h_l1105_c7_d86e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1105_c7_d86e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_cond;
     n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue;
     n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output := n8_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1114_c7_6e63] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output := result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1108_c7_446f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1105_c7_d86e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1108_c7_446f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;

     -- printf_uxn_opcodes_h_l1093_c3_eeb5[uxn_opcodes_h_l1093_c3_eeb5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1093_c3_eeb5_uxn_opcodes_h_l1093_c3_eeb5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1093_c3_eeb5_uxn_opcodes_h_l1093_c3_eeb5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1114_c7_6e63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue := VAR_MUX_uxn_opcodes_h_l1112_c32_e1af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1114_c7_6e63_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     -- t8_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := t8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1108_c7_446f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_d86e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     n8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     n8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := n8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1105_c7_d86e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1108_c7_446f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1108_c7_446f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1108_c7_446f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_446f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_d86e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1105_c7_d86e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_d86e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_d86e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_d86e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- n8_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := n8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_721d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_721d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1098_c7_bbdd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_bbdd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1092_c2_9b70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1125_l1088_DUPLICATE_5e6e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1125_l1088_DUPLICATE_5e6e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1092_c2_9b70_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1125_l1088_DUPLICATE_5e6e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1125_l1088_DUPLICATE_5e6e_return_output;
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
