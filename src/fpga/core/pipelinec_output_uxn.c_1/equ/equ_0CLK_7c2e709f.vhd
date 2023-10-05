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
-- BIN_OP_EQ[uxn_opcodes_h_l1140_c6_2620]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1140_c1_0e7c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal n8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal t8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c2_b12e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1141_c3_b963[uxn_opcodes_h_l1141_c3_b963]
signal printf_uxn_opcodes_h_l1141_c3_b963_uxn_opcodes_h_l1141_c3_b963_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1146_c11_99b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal n8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal t8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c7_d54d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_96f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal n8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal t8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_7cca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_b174]
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1153_c7_b8d3]
signal n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1153_c7_b8d3]
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_b8d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1153_c7_b8d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1153_c7_b8d3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_b8d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_b8d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_b8d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1156_c11_ce24]
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1156_c7_f235]
signal n8_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1156_c7_f235]
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c7_f235]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c7_f235]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1156_c7_f235]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c7_f235]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c7_f235]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c7_f235]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1160_c32_d535]
signal BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1160_c32_e5d7]
signal BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1160_c32_bda5]
signal MUX_uxn_opcodes_h_l1160_c32_bda5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1160_c32_bda5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1160_c32_bda5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1160_c32_bda5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1162_c11_4c98]
signal BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1162_c7_2f37]
signal result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1162_c7_2f37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1162_c7_2f37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1162_c7_2f37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1162_c7_2f37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1166_c24_5124]
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1166_c24_eed2]
signal MUX_uxn_opcodes_h_l1166_c24_eed2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1166_c24_eed2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1166_c24_eed2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1166_c24_eed2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1168_c11_db95]
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1168_c7_a6d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1168_c7_a6d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620
BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_return_output);

-- n8_MUX_uxn_opcodes_h_l1140_c2_b12e
n8_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
n8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- t8_MUX_uxn_opcodes_h_l1140_c2_b12e
t8_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
t8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e
result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e
result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e
result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

-- printf_uxn_opcodes_h_l1141_c3_b963_uxn_opcodes_h_l1141_c3_b963
printf_uxn_opcodes_h_l1141_c3_b963_uxn_opcodes_h_l1141_c3_b963 : entity work.printf_uxn_opcodes_h_l1141_c3_b963_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1141_c3_b963_uxn_opcodes_h_l1141_c3_b963_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output);

-- n8_MUX_uxn_opcodes_h_l1146_c7_d54d
n8_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
n8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- t8_MUX_uxn_opcodes_h_l1146_c7_d54d
t8_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
t8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output);

-- n8_MUX_uxn_opcodes_h_l1149_c7_7cca
n8_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
n8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- t8_MUX_uxn_opcodes_h_l1149_c7_7cca
t8_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
t8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_left,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_right,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output);

-- n8_MUX_uxn_opcodes_h_l1153_c7_b8d3
n8_MUX_uxn_opcodes_h_l1153_c7_b8d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond,
n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue,
n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse,
n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_left,
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_right,
BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output);

-- n8_MUX_uxn_opcodes_h_l1156_c7_f235
n8_MUX_uxn_opcodes_h_l1156_c7_f235 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1156_c7_f235_cond,
n8_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue,
n8_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse,
n8_MUX_uxn_opcodes_h_l1156_c7_f235_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_cond,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535
BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_left,
BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_right,
BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7
BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_left,
BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_right,
BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_return_output);

-- MUX_uxn_opcodes_h_l1160_c32_bda5
MUX_uxn_opcodes_h_l1160_c32_bda5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1160_c32_bda5_cond,
MUX_uxn_opcodes_h_l1160_c32_bda5_iftrue,
MUX_uxn_opcodes_h_l1160_c32_bda5_iffalse,
MUX_uxn_opcodes_h_l1160_c32_bda5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98
BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_left,
BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_right,
BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37
result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_cond,
result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37
result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37
result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37
result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124
BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_left,
BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_right,
BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_return_output);

-- MUX_uxn_opcodes_h_l1166_c24_eed2
MUX_uxn_opcodes_h_l1166_c24_eed2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1166_c24_eed2_cond,
MUX_uxn_opcodes_h_l1166_c24_eed2_iftrue,
MUX_uxn_opcodes_h_l1166_c24_eed2_iffalse,
MUX_uxn_opcodes_h_l1166_c24_eed2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_left,
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_right,
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_return_output,
 n8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 t8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output,
 n8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 t8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output,
 n8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 t8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output,
 n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output,
 n8_MUX_uxn_opcodes_h_l1156_c7_f235_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_return_output,
 MUX_uxn_opcodes_h_l1160_c32_bda5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_return_output,
 MUX_uxn_opcodes_h_l1166_c24_eed2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_ec36 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1141_c3_b963_uxn_opcodes_h_l1141_c3_b963_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_bdc3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_f1a3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_8dc6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_dc01 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1140_l1162_DUPLICATE_65e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_DUPLICATE_03e9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1156_l1149_l1153_l1146_DUPLICATE_b8c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1156_l1162_DUPLICATE_4cb1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1136_l1173_DUPLICATE_3211_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_bdc3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_bdc3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_ec36 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1143_c3_ec36;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_dc01 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_dc01;
     VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_f1a3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_f1a3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_8dc6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_8dc6;
     VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1156_l1162_DUPLICATE_4cb1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1156_l1162_DUPLICATE_4cb1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1140_l1162_DUPLICATE_65e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1140_l1162_DUPLICATE_65e7_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1156_l1149_l1153_l1146_DUPLICATE_b8c6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1156_l1149_l1153_l1146_DUPLICATE_b8c6_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1146_c11_99b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_DUPLICATE_03e9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_DUPLICATE_03e9_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1160_c32_d535] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_left;
     BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_return_output := BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1166_c24_5124] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_left;
     BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_return_output := BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1168_c11_db95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_left;
     BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_return_output := BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c6_2620] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1162_c11_4c98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_96f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1156_c11_ce24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_left;
     BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output := BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_b174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_left;
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output := BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1160_c32_d535_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c6_2620_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_99b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_96f9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_b174_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c11_ce24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1162_c11_4c98_return_output;
     VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1166_c24_5124_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_db95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_DUPLICATE_03e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_DUPLICATE_03e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_DUPLICATE_03e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_DUPLICATE_03e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_DUPLICATE_03e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1168_l1162_DUPLICATE_5eea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1140_l1162_DUPLICATE_65e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1140_l1162_DUPLICATE_65e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1140_l1162_DUPLICATE_65e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1140_l1162_DUPLICATE_65e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1153_l1149_l1146_l1140_l1162_DUPLICATE_65e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1156_l1149_l1153_l1146_DUPLICATE_b8c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1156_l1149_l1153_l1146_DUPLICATE_b8c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1156_l1149_l1153_l1146_DUPLICATE_b8c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1156_l1149_l1153_l1146_DUPLICATE_b8c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1168_DUPLICATE_cb94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1156_l1162_DUPLICATE_4cb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1156_l1162_DUPLICATE_4cb1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1156_l1153_l1149_l1146_l1140_l1162_DUPLICATE_4b8a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1162_c7_2f37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1140_c1_0e7c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1160_c32_e5d7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_left;
     BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_return_output := BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := t8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- n8_MUX[uxn_opcodes_h_l1156_c7_f235] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1156_c7_f235_cond <= VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_cond;
     n8_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue;
     n8_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_return_output := n8_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;

     -- MUX[uxn_opcodes_h_l1166_c24_eed2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1166_c24_eed2_cond <= VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_cond;
     MUX_uxn_opcodes_h_l1166_c24_eed2_iftrue <= VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_iftrue;
     MUX_uxn_opcodes_h_l1166_c24_eed2_iffalse <= VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_return_output := MUX_uxn_opcodes_h_l1166_c24_eed2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1168_c7_a6d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1162_c7_2f37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1156_c7_f235] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1168_c7_a6d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1160_c32_e5d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue := VAR_MUX_uxn_opcodes_h_l1166_c24_eed2_return_output;
     VAR_printf_uxn_opcodes_h_l1141_c3_b963_uxn_opcodes_h_l1141_c3_b963_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1140_c1_0e7c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_a6d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c7_f235] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1162_c7_2f37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;

     -- t8_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := t8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1153_c7_b8d3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;

     -- MUX[uxn_opcodes_h_l1160_c32_bda5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1160_c32_bda5_cond <= VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_cond;
     MUX_uxn_opcodes_h_l1160_c32_bda5_iftrue <= VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_iftrue;
     MUX_uxn_opcodes_h_l1160_c32_bda5_iffalse <= VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_return_output := MUX_uxn_opcodes_h_l1160_c32_bda5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c7_f235] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;

     -- n8_MUX[uxn_opcodes_h_l1153_c7_b8d3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond;
     n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue;
     n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output := n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1162_c7_2f37] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output := result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;

     -- printf_uxn_opcodes_h_l1141_c3_b963[uxn_opcodes_h_l1141_c3_b963] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1141_c3_b963_uxn_opcodes_h_l1141_c3_b963_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1141_c3_b963_uxn_opcodes_h_l1141_c3_b963_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1162_c7_2f37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue := VAR_MUX_uxn_opcodes_h_l1160_c32_bda5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1162_c7_2f37_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_b8d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1153_c7_b8d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c7_f235] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c7_f235] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1156_c7_f235] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_return_output := result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;

     -- t8_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := t8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := n8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c7_f235] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c7_f235_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_b8d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_b8d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- n8_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := n8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_b8d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1153_c7_b8d3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1153_c7_b8d3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1149_c7_7cca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;

     -- n8_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := n8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_7cca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1146_c7_d54d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_d54d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c2_b12e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1136_l1173_DUPLICATE_3211 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1136_l1173_DUPLICATE_3211_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c2_b12e_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1136_l1173_DUPLICATE_3211_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1136_l1173_DUPLICATE_3211_return_output;
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
