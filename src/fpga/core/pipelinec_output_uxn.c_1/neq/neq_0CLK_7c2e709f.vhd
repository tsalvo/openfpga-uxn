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
entity neq_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_7c2e709f;
architecture arch of neq_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_b9cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_4120]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1405_c2_9378]
signal t8_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1405_c2_9378]
signal n8_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1405_c2_9378]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_9378]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1405_c2_9378]
signal result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_9378]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_9378]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_9378]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_9378]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1406_c3_8cd2[uxn_opcodes_h_l1406_c3_8cd2]
signal printf_uxn_opcodes_h_l1406_c3_8cd2_uxn_opcodes_h_l1406_c3_8cd2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_0eaa]
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal t8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal n8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_bd86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_edda]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1414_c7_52da]
signal t8_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1414_c7_52da]
signal n8_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1414_c7_52da]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_52da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1414_c7_52da]
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1414_c7_52da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_52da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_52da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_52da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1418_c11_a51a]
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1418_c7_2201]
signal n8_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1418_c7_2201]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1418_c7_2201]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1418_c7_2201]
signal result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1418_c7_2201]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1418_c7_2201]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1418_c7_2201]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1418_c7_2201]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_a4b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1421_c7_28ee]
signal n8_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1421_c7_28ee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1421_c7_28ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1421_c7_28ee]
signal result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1421_c7_28ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_28ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_28ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1421_c7_28ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1425_c32_a34f]
signal BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1425_c32_79da]
signal BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1425_c32_ef2e]
signal MUX_uxn_opcodes_h_l1425_c32_ef2e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1425_c32_ef2e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1425_c32_ef2e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1425_c32_ef2e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_976d]
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1427_c7_ed14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1427_c7_ed14]
signal result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_ed14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_ed14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_ed14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1431_c24_4c06]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1431_c24_5409]
signal MUX_uxn_opcodes_h_l1431_c24_5409_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1431_c24_5409_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1431_c24_5409_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1431_c24_5409_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_36ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_b395]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_b395]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_return_output);

-- t8_MUX_uxn_opcodes_h_l1405_c2_9378
t8_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
t8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
t8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
t8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- n8_MUX_uxn_opcodes_h_l1405_c2_9378
n8_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
n8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
n8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
n8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378
result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378
result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

-- printf_uxn_opcodes_h_l1406_c3_8cd2_uxn_opcodes_h_l1406_c3_8cd2
printf_uxn_opcodes_h_l1406_c3_8cd2_uxn_opcodes_h_l1406_c3_8cd2 : entity work.printf_uxn_opcodes_h_l1406_c3_8cd2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1406_c3_8cd2_uxn_opcodes_h_l1406_c3_8cd2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_left,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_right,
BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output);

-- t8_MUX_uxn_opcodes_h_l1411_c7_bd86
t8_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
t8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- n8_MUX_uxn_opcodes_h_l1411_c7_bd86
n8_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
n8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86
result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output);

-- t8_MUX_uxn_opcodes_h_l1414_c7_52da
t8_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
t8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
t8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
t8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- n8_MUX_uxn_opcodes_h_l1414_c7_52da
n8_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
n8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
n8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
n8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_left,
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_right,
BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output);

-- n8_MUX_uxn_opcodes_h_l1418_c7_2201
n8_MUX_uxn_opcodes_h_l1418_c7_2201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1418_c7_2201_cond,
n8_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue,
n8_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse,
n8_MUX_uxn_opcodes_h_l1418_c7_2201_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_cond,
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output);

-- n8_MUX_uxn_opcodes_h_l1421_c7_28ee
n8_MUX_uxn_opcodes_h_l1421_c7_28ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1421_c7_28ee_cond,
n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue,
n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse,
n8_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_cond,
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f
BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_left,
BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_right,
BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da
BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_left,
BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_right,
BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_return_output);

-- MUX_uxn_opcodes_h_l1425_c32_ef2e
MUX_uxn_opcodes_h_l1425_c32_ef2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1425_c32_ef2e_cond,
MUX_uxn_opcodes_h_l1425_c32_ef2e_iftrue,
MUX_uxn_opcodes_h_l1425_c32_ef2e_iffalse,
MUX_uxn_opcodes_h_l1425_c32_ef2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_left,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_right,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14
result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14
result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_cond,
result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06
BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_return_output);

-- MUX_uxn_opcodes_h_l1431_c24_5409
MUX_uxn_opcodes_h_l1431_c24_5409 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1431_c24_5409_cond,
MUX_uxn_opcodes_h_l1431_c24_5409_iftrue,
MUX_uxn_opcodes_h_l1431_c24_5409_iffalse,
MUX_uxn_opcodes_h_l1431_c24_5409_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_return_output,
 t8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 n8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output,
 t8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 n8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output,
 t8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 n8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output,
 n8_MUX_uxn_opcodes_h_l1418_c7_2201_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output,
 n8_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_return_output,
 MUX_uxn_opcodes_h_l1425_c32_ef2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_return_output,
 MUX_uxn_opcodes_h_l1431_c24_5409_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_73cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1406_c3_8cd2_uxn_opcodes_h_l1406_c3_8cd2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_ce9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1416_c3_2f95 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1419_c3_fb8e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_29a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1431_c24_5409_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1431_c24_5409_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1431_c24_5409_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1431_c24_5409_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1421_DUPLICATE_0c96_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_DUPLICATE_69a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1411_l1421_l1414_DUPLICATE_fa52_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1421_l1427_DUPLICATE_55f3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1438_l1401_DUPLICATE_30d7_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_29a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_29a0;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_ce9b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1412_c3_ce9b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1416_c3_2f95 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1416_c3_2f95;
     VAR_MUX_uxn_opcodes_h_l1431_c24_5409_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1419_c3_fb8e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1419_c3_fb8e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1431_c24_5409_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_73cc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_73cc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_iffalse := resize(to_signed(-1, 2), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_a4b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1418_c11_a51a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c24_4c06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_36ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1411_l1421_l1414_DUPLICATE_fa52 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1411_l1421_l1414_DUPLICATE_fa52_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_976d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_edda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1421_l1427_DUPLICATE_55f3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1421_l1427_DUPLICATE_55f3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1421_DUPLICATE_0c96 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1421_DUPLICATE_0c96_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_DUPLICATE_69a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_DUPLICATE_69a4_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_b9cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1425_c32_a34f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_left;
     BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_return_output := BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1411_c11_0eaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1425_c32_a34f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_b9cc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1411_c11_0eaa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_edda_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1418_c11_a51a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_a4b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_976d_return_output;
     VAR_MUX_uxn_opcodes_h_l1431_c24_5409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c24_4c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_36ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1421_DUPLICATE_0c96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1421_DUPLICATE_0c96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1421_DUPLICATE_0c96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1421_DUPLICATE_0c96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1421_DUPLICATE_0c96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1433_l1427_l1421_DUPLICATE_f503_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_DUPLICATE_69a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_DUPLICATE_69a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_DUPLICATE_69a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_DUPLICATE_69a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_DUPLICATE_69a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1411_l1421_l1414_DUPLICATE_fa52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1411_l1421_l1414_DUPLICATE_fa52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1411_l1421_l1414_DUPLICATE_fa52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1418_l1411_l1421_l1414_DUPLICATE_fa52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1433_l1421_DUPLICATE_d25f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1421_l1427_DUPLICATE_55f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1421_l1427_DUPLICATE_55f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1418_l1414_l1411_l1405_l1427_l1421_DUPLICATE_c1b8_return_output;
     -- n8_MUX[uxn_opcodes_h_l1421_c7_28ee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1421_c7_28ee_cond <= VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_cond;
     n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue;
     n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output := n8_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;

     -- MUX[uxn_opcodes_h_l1431_c24_5409] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1431_c24_5409_cond <= VAR_MUX_uxn_opcodes_h_l1431_c24_5409_cond;
     MUX_uxn_opcodes_h_l1431_c24_5409_iftrue <= VAR_MUX_uxn_opcodes_h_l1431_c24_5409_iftrue;
     MUX_uxn_opcodes_h_l1431_c24_5409_iffalse <= VAR_MUX_uxn_opcodes_h_l1431_c24_5409_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1431_c24_5409_return_output := MUX_uxn_opcodes_h_l1431_c24_5409_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1427_c7_ed14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_4120] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_return_output;

     -- t8_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     t8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     t8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := t8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_ed14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_b395] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1425_c32_79da] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_left;
     BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_return_output := BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1421_c7_28ee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_b395] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1425_c32_79da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue := VAR_MUX_uxn_opcodes_h_l1431_c24_5409_return_output;
     VAR_printf_uxn_opcodes_h_l1406_c3_8cd2_uxn_opcodes_h_l1406_c3_8cd2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_4120_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_b395_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_b395_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1427_c7_ed14] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output := result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;

     -- printf_uxn_opcodes_h_l1406_c3_8cd2[uxn_opcodes_h_l1406_c3_8cd2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1406_c3_8cd2_uxn_opcodes_h_l1406_c3_8cd2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1406_c3_8cd2_uxn_opcodes_h_l1406_c3_8cd2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1418_c7_2201] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1421_c7_28ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;

     -- MUX[uxn_opcodes_h_l1425_c32_ef2e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1425_c32_ef2e_cond <= VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_cond;
     MUX_uxn_opcodes_h_l1425_c32_ef2e_iftrue <= VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_iftrue;
     MUX_uxn_opcodes_h_l1425_c32_ef2e_iffalse <= VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_return_output := MUX_uxn_opcodes_h_l1425_c32_ef2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_ed14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1421_c7_28ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_ed14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;

     -- n8_MUX[uxn_opcodes_h_l1418_c7_2201] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1418_c7_2201_cond <= VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_cond;
     n8_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue;
     n8_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_return_output := n8_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;

     -- t8_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := t8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue := VAR_MUX_uxn_opcodes_h_l1425_c32_ef2e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1427_c7_ed14_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1418_c7_2201] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_28ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;

     -- t8_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     t8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     t8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := t8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1421_c7_28ee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output := result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     n8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     n8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := n8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_28ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1421_c7_28ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1418_c7_2201] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1421_c7_28ee_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;
     -- n8_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := n8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1418_c7_2201] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_return_output := result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1418_c7_2201] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1418_c7_2201] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1418_c7_2201] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1418_c7_2201_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- n8_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     n8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     n8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := n8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_52da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c7_52da_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1411_c7_bd86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1411_c7_bd86_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_9378] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1438_l1401_DUPLICATE_30d7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1438_l1401_DUPLICATE_30d7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_9378_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_9378_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1438_l1401_DUPLICATE_30d7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1438_l1401_DUPLICATE_30d7_return_output;
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
