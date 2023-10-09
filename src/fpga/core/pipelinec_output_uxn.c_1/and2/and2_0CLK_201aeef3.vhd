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
entity and2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_201aeef3;
architecture arch of and2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1046_c6_10fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_4317]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1046_c2_b5ff]
signal n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1047_c3_813c[uxn_opcodes_h_l1047_c3_813c]
signal printf_uxn_opcodes_h_l1047_c3_813c_uxn_opcodes_h_l1047_c3_813c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_f0a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1052_c7_9fb6]
signal n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_c237]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal t16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1055_c7_01cb]
signal n16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_6168]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1060_c7_7707]
signal t16_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1060_c7_7707]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1060_c7_7707]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1060_c7_7707]
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1060_c7_7707]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c7_7707]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c7_7707]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1060_c7_7707]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1060_c7_7707]
signal tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1060_c7_7707]
signal n16_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_c7c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1063_c7_106c]
signal t16_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1063_c7_106c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_106c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1063_c7_106c]
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c7_106c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_106c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_106c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_106c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1063_c7_106c]
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1063_c7_106c]
signal n16_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1064_c3_6f70]
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_6b9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1067_c7_e7e4]
signal n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1070_c11_343b]
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1070_c7_0102]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1070_c7_0102]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1070_c7_0102]
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1070_c7_0102]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1070_c7_0102]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1070_c7_0102]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1070_c7_0102]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1070_c7_0102]
signal tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1070_c7_0102]
signal n16_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_b7ba]
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1075_c7_86eb]
signal n16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1078_c11_d04d]
signal BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1078_c7_52ae]
signal n16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1079_c3_eb3d]
signal BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1080_c11_dbc0]
signal BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1083_c32_7d8f]
signal BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1083_c32_12da]
signal BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1083_c32_6fc5]
signal MUX_uxn_opcodes_h_l1083_c32_6fc5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1083_c32_6fc5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1083_c32_6fc5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1083_c32_6fc5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_5ef7]
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_71df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_71df]
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_71df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_71df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_71df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1091_c11_6902]
signal BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1091_c7_249c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1091_c7_249c]
signal result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1091_c7_249c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1091_c7_249c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1093_c34_509b]
signal CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_899e]
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_ddf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_ddf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc
BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_return_output);

-- t16_MUX_uxn_opcodes_h_l1046_c2_b5ff
t16_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff
result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff
result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff
result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff
tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- n16_MUX_uxn_opcodes_h_l1046_c2_b5ff
n16_MUX_uxn_opcodes_h_l1046_c2_b5ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond,
n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue,
n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse,
n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

-- printf_uxn_opcodes_h_l1047_c3_813c_uxn_opcodes_h_l1047_c3_813c
printf_uxn_opcodes_h_l1047_c3_813c_uxn_opcodes_h_l1047_c3_813c : entity work.printf_uxn_opcodes_h_l1047_c3_813c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1047_c3_813c_uxn_opcodes_h_l1047_c3_813c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output);

-- t16_MUX_uxn_opcodes_h_l1052_c7_9fb6
t16_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6
tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- n16_MUX_uxn_opcodes_h_l1052_c7_9fb6
n16_MUX_uxn_opcodes_h_l1052_c7_9fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond,
n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue,
n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse,
n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output);

-- t16_MUX_uxn_opcodes_h_l1055_c7_01cb
t16_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
t16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb
tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1055_c7_01cb
n16_MUX_uxn_opcodes_h_l1055_c7_01cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond,
n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue,
n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse,
n16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output);

-- t16_MUX_uxn_opcodes_h_l1060_c7_7707
t16_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
t16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
t16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
t16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1060_c7_7707
tmp16_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- n16_MUX_uxn_opcodes_h_l1060_c7_7707
n16_MUX_uxn_opcodes_h_l1060_c7_7707 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1060_c7_7707_cond,
n16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue,
n16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse,
n16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output);

-- t16_MUX_uxn_opcodes_h_l1063_c7_106c
t16_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
t16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
t16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
t16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1063_c7_106c
tmp16_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- n16_MUX_uxn_opcodes_h_l1063_c7_106c
n16_MUX_uxn_opcodes_h_l1063_c7_106c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1063_c7_106c_cond,
n16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue,
n16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse,
n16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70
BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_left,
BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_right,
BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4
tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- n16_MUX_uxn_opcodes_h_l1067_c7_e7e4
n16_MUX_uxn_opcodes_h_l1067_c7_e7e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond,
n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue,
n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse,
n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_left,
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_right,
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102
result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1070_c7_0102
tmp16_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- n16_MUX_uxn_opcodes_h_l1070_c7_0102
n16_MUX_uxn_opcodes_h_l1070_c7_0102 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1070_c7_0102_cond,
n16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue,
n16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse,
n16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_left,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_right,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb
tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- n16_MUX_uxn_opcodes_h_l1075_c7_86eb
n16_MUX_uxn_opcodes_h_l1075_c7_86eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond,
n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue,
n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse,
n16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d
BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_left,
BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_right,
BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae
tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- n16_MUX_uxn_opcodes_h_l1078_c7_52ae
n16_MUX_uxn_opcodes_h_l1078_c7_52ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond,
n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue,
n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse,
n16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d
BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_left,
BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_right,
BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0
BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_left,
BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_right,
BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f
BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_left,
BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_right,
BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da
BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_left,
BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_right,
BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_return_output);

-- MUX_uxn_opcodes_h_l1083_c32_6fc5
MUX_uxn_opcodes_h_l1083_c32_6fc5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1083_c32_6fc5_cond,
MUX_uxn_opcodes_h_l1083_c32_6fc5_iftrue,
MUX_uxn_opcodes_h_l1083_c32_6fc5_iffalse,
MUX_uxn_opcodes_h_l1083_c32_6fc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_left,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_right,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_cond,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902
BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_left,
BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_right,
BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c
result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1093_c34_509b
CONST_SR_8_uxn_opcodes_h_l1093_c34_509b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_x,
CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_left,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_right,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_return_output,
 t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output,
 t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output,
 t16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 n16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output,
 t16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 n16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output,
 t16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 n16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 n16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 n16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 n16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_return_output,
 MUX_uxn_opcodes_h_l1083_c32_6fc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_b86c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1047_c3_813c_uxn_opcodes_h_l1047_c3_813c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_dc0a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_f158 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_972f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_e5be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1068_c3_2f8c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_99e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_7288 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1088_c3_6567 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1089_c24_3062_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1092_c3_af3f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1093_c24_cdfb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1079_l1064_l1056_l1071_DUPLICATE_ea8f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1091_l1078_DUPLICATE_f467_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1100_l1042_DUPLICATE_9406_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_99e7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_99e7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1068_c3_2f8c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1068_c3_2f8c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1092_c3_af3f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1092_c3_af3f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_b86c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_b86c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_dc0a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_dc0a;
     VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_e5be := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_e5be;
     VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_7288 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_7288;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_f158 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_f158;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1088_c3_6567 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1088_c3_6567;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_972f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_972f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_6168] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1079_l1064_l1056_l1071_DUPLICATE_ea8f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1079_l1064_l1056_l1071_DUPLICATE_ea8f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1091_c11_6902] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_left;
     BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output := BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c6_10fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1089_c24_3062] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1089_c24_3062_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_c7c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_6b9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1091_l1078_DUPLICATE_f467 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1091_l1078_DUPLICATE_f467_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1083_c32_7d8f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_left;
     BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_return_output := BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_c237] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_899e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1070_c11_343b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l1093_c34_509b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_return_output := CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1078_c11_d04d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_f0a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_b7ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_5ef7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1083_c32_7d8f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c6_10fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_f0a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_c237_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_6168_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_c7c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_6b9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_343b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_b7ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_d04d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_5ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1091_c11_6902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_899e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1079_l1064_l1056_l1071_DUPLICATE_ea8f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1079_l1064_l1056_l1071_DUPLICATE_ea8f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1079_l1064_l1056_l1071_DUPLICATE_ea8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1089_c24_3062_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_bf9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1095_l1063_l1091_l1060_l1085_l1055_l1078_l1052_l1075_DUPLICATE_4a12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1060_l1085_l1055_l1052_l1075_DUPLICATE_22bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1078_l1052_l1075_DUPLICATE_2e7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1095_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_0268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1091_l1078_DUPLICATE_f467_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1091_l1078_DUPLICATE_f467_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1046_l1070_l1067_l1063_l1091_l1060_l1055_l1078_l1052_l1075_DUPLICATE_1b6e_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1093_c24_cdfb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1093_c24_cdfb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1093_c34_509b_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1083_c32_12da] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_left;
     BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_return_output := BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1064_c3_6f70] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_left;
     BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_return_output := BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1079_c3_eb3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_left;
     BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_return_output := BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_4317] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1091_c7_249c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_ddf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_ddf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_71df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1083_c32_12da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_6f70_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c3_eb3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1093_c24_cdfb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1072_l1057_DUPLICATE_5e8b_return_output;
     VAR_printf_uxn_opcodes_h_l1047_c3_813c_uxn_opcodes_h_l1047_c3_813c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_4317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_ddf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1091_c7_249c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1091_c7_249c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1091_c7_249c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_71df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;

     -- MUX[uxn_opcodes_h_l1083_c32_6fc5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1083_c32_6fc5_cond <= VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_cond;
     MUX_uxn_opcodes_h_l1083_c32_6fc5_iftrue <= VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_iftrue;
     MUX_uxn_opcodes_h_l1083_c32_6fc5_iffalse <= VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_return_output := MUX_uxn_opcodes_h_l1083_c32_6fc5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1091_c7_249c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     t16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     t16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := t16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := n16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- printf_uxn_opcodes_h_l1047_c3_813c[uxn_opcodes_h_l1047_c3_813c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1047_c3_813c_uxn_opcodes_h_l1047_c3_813c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1047_c3_813c_uxn_opcodes_h_l1047_c3_813c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_AND[uxn_opcodes_h_l1080_c11_dbc0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_left;
     BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_return_output := BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1080_c11_dbc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue := VAR_MUX_uxn_opcodes_h_l1083_c32_6fc5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1091_c7_249c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1091_c7_249c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1091_c7_249c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_71df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_71df] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_return_output := result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;

     -- n16_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := n16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_71df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     t16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     t16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := t16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_71df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- t16_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := t16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1078_c7_52ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     n16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     n16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := n16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_52ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_86eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_86eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     n16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     n16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := n16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1070_c7_0102] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- t16_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_0102_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     n16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     n16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := n16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1067_c7_e7e4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_e7e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- n16_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := n16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_106c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_106c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c7_7707] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_7707_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_01cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_01cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1052_c7_9fb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1052_c7_9fb6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c2_b5ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1100_l1042_DUPLICATE_9406 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1100_l1042_DUPLICATE_9406_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c2_b5ff_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1100_l1042_DUPLICATE_9406_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1100_l1042_DUPLICATE_9406_return_output;
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
