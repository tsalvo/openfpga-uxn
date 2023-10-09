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
-- Submodules: 185
entity rot2_0CLK_79985188 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_79985188;
architecture arch of rot2_0CLK_79985188 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l3086_c6_cbec]
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_028a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal t16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal l16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3086_c2_26f1]
signal n16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l3087_c3_f055[uxn_opcodes_h_l3087_c3_f055]
signal printf_uxn_opcodes_h_l3087_c3_f055_uxn_opcodes_h_l3087_c3_f055_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_0a47]
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3092_c7_6d3c]
signal n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_ea92]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3095_c7_5592]
signal t16_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3095_c7_5592]
signal l16_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3095_c7_5592]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3095_c7_5592]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_5592]
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3095_c7_5592]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_5592]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_5592]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_5592]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3095_c7_5592]
signal n16_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_6bac]
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3100_c7_d108]
signal t16_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3100_c7_d108]
signal l16_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3100_c7_d108]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3100_c7_d108]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3100_c7_d108]
signal result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3100_c7_d108]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3100_c7_d108]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3100_c7_d108]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3100_c7_d108]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3100_c7_d108]
signal n16_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_3d41]
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3103_c7_8b6c]
signal n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3104_c3_6f9f]
signal BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_7e2a]
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal l16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3107_c7_b83c]
signal n16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_db06]
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal l16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3110_c7_9c48]
signal n16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_5299]
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal l16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3115_c7_36d1]
signal n16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_fca5]
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3118_c7_5498]
signal l16_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3118_c7_5498]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3118_c7_5498]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3118_c7_5498]
signal result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3118_c7_5498]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3118_c7_5498]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3118_c7_5498]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3118_c7_5498]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l3118_c7_5498]
signal n16_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3119_c3_e704]
signal BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3122_c11_7344]
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3122_c7_6e64]
signal l16_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3122_c7_6e64]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3122_c7_6e64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3122_c7_6e64]
signal result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3122_c7_6e64]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3122_c7_6e64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3122_c7_6e64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3122_c7_6e64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3125_c11_79b6]
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3125_c7_02c5]
signal l16_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3125_c7_02c5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3125_c7_02c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3125_c7_02c5]
signal result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3125_c7_02c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3125_c7_02c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3125_c7_02c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3125_c7_02c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3130_c11_344e]
signal BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3130_c7_1277]
signal l16_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3130_c7_1277]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3130_c7_1277]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3130_c7_1277]
signal result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3130_c7_1277]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3130_c7_1277]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3130_c7_1277]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3130_c7_1277]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3133_c11_a0da]
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3133_c7_86b8]
signal l16_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3133_c7_86b8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3133_c7_86b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3133_c7_86b8]
signal result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3133_c7_86b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3133_c7_86b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3133_c7_86b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3133_c7_86b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3134_c3_275c]
signal BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3137_c32_5efa]
signal BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3137_c32_bb07]
signal BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3137_c32_2d8f]
signal MUX_uxn_opcodes_h_l3137_c32_2d8f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3137_c32_2d8f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3137_c32_2d8f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3137_c32_2d8f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3139_c11_1096]
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3139_c7_f172]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3139_c7_f172]
signal result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3139_c7_f172]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3139_c7_f172]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3139_c7_f172]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3145_c11_f802]
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3145_c7_c779]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3145_c7_c779]
signal result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3145_c7_c779]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3145_c7_c779]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3147_c34_f9f9]
signal CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3149_c11_7031]
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3149_c7_03d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3149_c7_03d6]
signal result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3149_c7_03d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3149_c7_03d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3153_c11_549c]
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3153_c7_e52c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3153_c7_e52c]
signal result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3153_c7_e52c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3153_c7_e52c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3155_c34_4010]
signal CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3157_c11_73e5]
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3157_c7_71cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3157_c7_71cc]
signal result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3157_c7_71cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3157_c7_71cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3161_c11_5224]
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3161_c7_1a53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3161_c7_1a53]
signal result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3161_c7_1a53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3161_c7_1a53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3163_c34_cdd5]
signal CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3165_c11_f19e]
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3165_c7_045b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3165_c7_045b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec
BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_left,
BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_right,
BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_return_output);

-- t16_MUX_uxn_opcodes_h_l3086_c2_26f1
t16_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
t16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- l16_MUX_uxn_opcodes_h_l3086_c2_26f1
l16_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
l16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1
result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- n16_MUX_uxn_opcodes_h_l3086_c2_26f1
n16_MUX_uxn_opcodes_h_l3086_c2_26f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond,
n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue,
n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse,
n16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

-- printf_uxn_opcodes_h_l3087_c3_f055_uxn_opcodes_h_l3087_c3_f055
printf_uxn_opcodes_h_l3087_c3_f055_uxn_opcodes_h_l3087_c3_f055 : entity work.printf_uxn_opcodes_h_l3087_c3_f055_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3087_c3_f055_uxn_opcodes_h_l3087_c3_f055_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_left,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_right,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output);

-- t16_MUX_uxn_opcodes_h_l3092_c7_6d3c
t16_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- l16_MUX_uxn_opcodes_h_l3092_c7_6d3c
l16_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- n16_MUX_uxn_opcodes_h_l3092_c7_6d3c
n16_MUX_uxn_opcodes_h_l3092_c7_6d3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond,
n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue,
n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse,
n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output);

-- t16_MUX_uxn_opcodes_h_l3095_c7_5592
t16_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
t16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
t16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
t16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- l16_MUX_uxn_opcodes_h_l3095_c7_5592
l16_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
l16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
l16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
l16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- n16_MUX_uxn_opcodes_h_l3095_c7_5592
n16_MUX_uxn_opcodes_h_l3095_c7_5592 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3095_c7_5592_cond,
n16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue,
n16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse,
n16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_left,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_right,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output);

-- t16_MUX_uxn_opcodes_h_l3100_c7_d108
t16_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
t16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
t16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
t16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- l16_MUX_uxn_opcodes_h_l3100_c7_d108
l16_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
l16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
l16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
l16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108
result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108
result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108
result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108
result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108
result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108
result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- n16_MUX_uxn_opcodes_h_l3100_c7_d108
n16_MUX_uxn_opcodes_h_l3100_c7_d108 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3100_c7_d108_cond,
n16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue,
n16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse,
n16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_left,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_right,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output);

-- t16_MUX_uxn_opcodes_h_l3103_c7_8b6c
t16_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- l16_MUX_uxn_opcodes_h_l3103_c7_8b6c
l16_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c
result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c
result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- n16_MUX_uxn_opcodes_h_l3103_c7_8b6c
n16_MUX_uxn_opcodes_h_l3103_c7_8b6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond,
n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue,
n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse,
n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f
BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_left,
BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_right,
BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_left,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_right,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output);

-- l16_MUX_uxn_opcodes_h_l3107_c7_b83c
l16_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
l16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c
result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c
result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c
result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c
result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- n16_MUX_uxn_opcodes_h_l3107_c7_b83c
n16_MUX_uxn_opcodes_h_l3107_c7_b83c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond,
n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue,
n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse,
n16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_left,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_right,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output);

-- l16_MUX_uxn_opcodes_h_l3110_c7_9c48
l16_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
l16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48
result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48
result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48
result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48
result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48
result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48
result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- n16_MUX_uxn_opcodes_h_l3110_c7_9c48
n16_MUX_uxn_opcodes_h_l3110_c7_9c48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond,
n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue,
n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse,
n16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_left,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_right,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output);

-- l16_MUX_uxn_opcodes_h_l3115_c7_36d1
l16_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
l16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1
result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- n16_MUX_uxn_opcodes_h_l3115_c7_36d1
n16_MUX_uxn_opcodes_h_l3115_c7_36d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond,
n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue,
n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse,
n16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_left,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_right,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output);

-- l16_MUX_uxn_opcodes_h_l3118_c7_5498
l16_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
l16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
l16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
l16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498
result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498
result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498
result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- n16_MUX_uxn_opcodes_h_l3118_c7_5498
n16_MUX_uxn_opcodes_h_l3118_c7_5498 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3118_c7_5498_cond,
n16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue,
n16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse,
n16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704
BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_left,
BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_right,
BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_left,
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_right,
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output);

-- l16_MUX_uxn_opcodes_h_l3122_c7_6e64
l16_MUX_uxn_opcodes_h_l3122_c7_6e64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3122_c7_6e64_cond,
l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue,
l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse,
l16_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64
result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64
result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64
result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_cond,
result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64
result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_left,
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_right,
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output);

-- l16_MUX_uxn_opcodes_h_l3125_c7_02c5
l16_MUX_uxn_opcodes_h_l3125_c7_02c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3125_c7_02c5_cond,
l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue,
l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse,
l16_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5
result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5
result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e
BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_left,
BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_right,
BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output);

-- l16_MUX_uxn_opcodes_h_l3130_c7_1277
l16_MUX_uxn_opcodes_h_l3130_c7_1277 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3130_c7_1277_cond,
l16_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue,
l16_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse,
l16_MUX_uxn_opcodes_h_l3130_c7_1277_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277
result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277
result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277
result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_cond,
result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277
result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277
result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277
result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_left,
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_right,
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output);

-- l16_MUX_uxn_opcodes_h_l3133_c7_86b8
l16_MUX_uxn_opcodes_h_l3133_c7_86b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3133_c7_86b8_cond,
l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue,
l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse,
l16_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8
result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8
result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c
BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_left,
BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_right,
BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa
BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_left,
BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_right,
BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07
BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_left,
BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_right,
BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_return_output);

-- MUX_uxn_opcodes_h_l3137_c32_2d8f
MUX_uxn_opcodes_h_l3137_c32_2d8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3137_c32_2d8f_cond,
MUX_uxn_opcodes_h_l3137_c32_2d8f_iftrue,
MUX_uxn_opcodes_h_l3137_c32_2d8f_iffalse,
MUX_uxn_opcodes_h_l3137_c32_2d8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_left,
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_right,
BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172
result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172
result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_cond,
result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172
result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172
result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_left,
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_right,
BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779
result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779
result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_cond,
result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779
result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9
CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_x,
CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_left,
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_right,
BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6
result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6
result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6
result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_left,
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_right,
BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c
result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c
result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_cond,
result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c
result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3155_c34_4010
CONST_SR_8_uxn_opcodes_h_l3155_c34_4010 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_x,
CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_left,
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_right,
BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc
result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc
result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc
result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_left,
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_right,
BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53
result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53
result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_cond,
result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53
result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5
CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_x,
CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_left,
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_right,
BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b
result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b
result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55
CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_return_output,
 t16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 l16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 n16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output,
 t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output,
 t16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 l16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 n16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output,
 t16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 l16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 n16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output,
 t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output,
 l16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 n16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output,
 l16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 n16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output,
 l16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 n16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output,
 l16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 n16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output,
 l16_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output,
 l16_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output,
 l16_MUX_uxn_opcodes_h_l3130_c7_1277_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output,
 l16_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_return_output,
 MUX_uxn_opcodes_h_l3137_c32_2d8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_return_output,
 CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output,
 CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output,
 CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3089_c3_0f57 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3087_c3_f055_uxn_opcodes_h_l3087_c3_f055_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3093_c3_945a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3098_c3_55db : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3101_c3_d23f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3105_c3_f3b9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3108_c3_4f74 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3113_c3_d27d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3116_c3_27f9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3120_c3_2fa1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3123_c3_2f98 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3128_c3_8936 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3131_c3_dc89 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3142_c3_bd62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3143_c24_f724_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3146_c3_1ae1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3147_c24_604a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3150_c3_28c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3151_c24_5ab5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3154_c3_99a4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3155_c24_0244_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3158_c3_2548 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3159_c24_c8ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3162_c3_8b60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3163_c24_cdec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3119_l3126_l3134_l3104_l3096_l3111_DUPLICATE_117b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_l3161_DUPLICATE_f9b5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3170_l3082_DUPLICATE_6698_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3123_c3_2f98 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3123_c3_2f98;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_right := to_unsigned(17, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3116_c3_27f9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3116_c3_27f9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3154_c3_99a4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3154_c3_99a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3108_c3_4f74 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3108_c3_4f74;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3101_c3_d23f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3101_c3_d23f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3131_c3_dc89 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3131_c3_dc89;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3098_c3_55db := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3098_c3_55db;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3120_c3_2fa1 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3120_c3_2fa1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3158_c3_2548 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3158_c3_2548;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3113_c3_d27d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3113_c3_d27d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3089_c3_0f57 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3089_c3_0f57;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3142_c3_bd62 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3142_c3_bd62;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3128_c3_8936 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3128_c3_8936;
     VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_right := to_unsigned(12, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3093_c3_945a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3093_c3_945a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3150_c3_28c7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3150_c3_28c7;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3162_c3_8b60 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3162_c3_8b60;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3105_c3_f3b9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3105_c3_f3b9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3146_c3_1ae1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3146_c3_1ae1;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l3161_c11_5224] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_left;
     BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output := BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l3155_c34_4010] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_return_output := CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_5299] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_left;
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output := BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_fca5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3119_l3126_l3134_l3104_l3096_l3111_DUPLICATE_117b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3119_l3126_l3134_l3104_l3096_l3111_DUPLICATE_117b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_3d41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_left;
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output := BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3133_c11_a0da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_left;
     BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output := BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_6bac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_left;
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output := BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3137_c32_5efa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_left;
     BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_return_output := BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3145_c11_f802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_left;
     BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output := BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l3139_c11_1096] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_left;
     BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output := BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3122_c11_7344] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_left;
     BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output := BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3130_c11_344e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3153_c11_549c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3165_c11_f19e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_7e2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3125_c11_79b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3159_c24_c8ab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3159_c24_c8ab_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_0a47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_left;
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output := BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3151_c24_5ab5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3151_c24_5ab5_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3157_c11_73e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_db06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_left;
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output := BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3086_c6_cbec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_left;
     BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output := BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3163_c34_cdd5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_return_output := CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_l3161_DUPLICATE_f9b5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_l3161_DUPLICATE_f9b5_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3149_c11_7031] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_left;
     BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output := BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3147_c34_f9f9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_return_output := CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3143_c24_f724] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3143_c24_f724_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_ea92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3137_c32_5efa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c6_cbec_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_0a47_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_ea92_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_6bac_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_3d41_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_7e2a_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_db06_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_5299_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_fca5_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_7344_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_79b6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3130_c11_344e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_a0da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3139_c11_1096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3145_c11_f802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3149_c11_7031_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3153_c11_549c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3157_c11_73e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3161_c11_5224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3165_c11_f19e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3119_l3126_l3134_l3104_l3096_l3111_DUPLICATE_117b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3119_l3126_l3134_l3104_l3096_l3111_DUPLICATE_117b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3119_l3126_l3134_l3104_l3096_l3111_DUPLICATE_117b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3119_l3126_l3134_l3104_l3096_l3111_DUPLICATE_117b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3143_c24_f724_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3151_c24_5ab5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3159_c24_c8ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_7e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3165_l3161_l3157_l3153_l3149_l3145_l3139_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_2648_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3086_l3110_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_l3139_DUPLICATE_76e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3110_l3133_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_5506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3086_l3165_l3161_l3157_l3153_l3149_l3145_l3133_l3130_l3125_l3122_l3118_l3115_l3110_l3107_l3103_l3100_l3095_l3092_DUPLICATE_20b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_l3161_DUPLICATE_f9b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_l3161_DUPLICATE_f9b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3086_l3110_l3133_l3161_l3107_l3130_l3103_l3125_l3100_l3122_l3095_l3118_l3092_l3115_DUPLICATE_0e80_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l3134_c3_275c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_left;
     BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_return_output := BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3119_c3_e704] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_left;
     BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_return_output := BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3133_c7_86b8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_028a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3165_c7_045b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3161_c7_1a53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3147_c24_604a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3147_c24_604a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3147_c34_f9f9_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3165_c7_045b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3104_c3_6f9f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_left;
     BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_return_output := BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3139_c7_f172] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3163_c24_cdec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3163_c24_cdec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3163_c34_cdd5_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3137_c32_bb07] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_left;
     BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_return_output := BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3155_c24_0244] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3155_c24_0244_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3155_c34_4010_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3137_c32_bb07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3104_c3_6f9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3119_c3_e704_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3134_c3_275c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3147_c24_604a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3155_c24_0244_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3163_c24_cdec_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3127_l3097_l3112_DUPLICATE_0c55_return_output;
     VAR_printf_uxn_opcodes_h_l3087_c3_f055_uxn_opcodes_h_l3087_c3_f055_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_028a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3165_c7_045b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3165_c7_045b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3130_c7_1277] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;

     -- printf_uxn_opcodes_h_l3087_c3_f055[uxn_opcodes_h_l3087_c3_f055] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3087_c3_f055_uxn_opcodes_h_l3087_c3_f055_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3087_c3_f055_uxn_opcodes_h_l3087_c3_f055_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l3161_c7_1a53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output := result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output;

     -- t16_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3133_c7_86b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;

     -- MUX[uxn_opcodes_h_l3137_c32_2d8f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3137_c32_2d8f_cond <= VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_cond;
     MUX_uxn_opcodes_h_l3137_c32_2d8f_iftrue <= VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_iftrue;
     MUX_uxn_opcodes_h_l3137_c32_2d8f_iffalse <= VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_return_output := MUX_uxn_opcodes_h_l3137_c32_2d8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3161_c7_1a53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3157_c7_71cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output;

     -- l16_MUX[uxn_opcodes_h_l3133_c7_86b8] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3133_c7_86b8_cond <= VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_cond;
     l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue;
     l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output := l16_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     n16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     n16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := n16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3161_c7_1a53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue := VAR_MUX_uxn_opcodes_h_l3137_c32_2d8f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3161_c7_1a53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3153_c7_e52c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3157_c7_71cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output;

     -- l16_MUX[uxn_opcodes_h_l3130_c7_1277] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3130_c7_1277_cond <= VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_cond;
     l16_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue;
     l16_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_return_output := l16_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3157_c7_71cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := n16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3157_c7_71cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output;

     -- t16_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     t16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     t16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := t16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3125_c7_02c5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3130_c7_1277] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3133_c7_86b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3157_c7_71cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3153_c7_e52c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3149_c7_03d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3130_c7_1277] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3153_c7_e52c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3153_c7_e52c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output := result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3125_c7_02c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;

     -- t16_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     t16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     t16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := t16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- l16_MUX[uxn_opcodes_h_l3125_c7_02c5] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3125_c7_02c5_cond <= VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_cond;
     l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue;
     l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output := l16_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;

     -- n16_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := n16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3122_c7_6e64] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3153_c7_e52c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3149_c7_03d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3125_c7_02c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3122_c7_6e64] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3145_c7_c779] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_return_output;

     -- t16_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := n16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- l16_MUX[uxn_opcodes_h_l3122_c7_6e64] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3122_c7_6e64_cond <= VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_cond;
     l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue;
     l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output := l16_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3149_c7_03d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3149_c7_03d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3145_c7_c779_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3149_c7_03d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     -- t16_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := t16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- n16_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3145_c7_c779] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_return_output := result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3145_c7_c779] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3145_c7_c779] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3139_c7_f172] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3122_c7_6e64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;

     -- l16_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     l16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     l16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := l16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3145_c7_c779_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3145_c7_c779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3145_c7_c779_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;
     -- l16_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := l16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3139_c7_f172] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_return_output := result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3139_c7_f172] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- n16_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     n16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     n16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := n16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3139_c7_f172] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3133_c7_86b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3139_c7_f172_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3133_c7_86b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3133_c7_86b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- l16_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := l16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3133_c7_86b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3130_c7_1277] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- n16_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     n16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     n16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := n16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_86b8_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- l16_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := l16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3130_c7_1277] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3130_c7_1277] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3130_c7_1277] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_return_output := result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3125_c7_02c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- n16_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3130_c7_1277_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3125_c7_02c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3125_c7_02c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;

     -- n16_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := n16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3122_c7_6e64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3125_c7_02c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;

     -- l16_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_02c5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3122_c7_6e64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3122_c7_6e64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3122_c7_6e64] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output := result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;

     -- l16_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     l16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     l16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := l16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3122_c7_6e64_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- l16_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     l16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     l16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := l16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3118_c7_5498] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5498_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3115_c7_36d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- l16_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_36d1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3110_c7_9c48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;

     -- l16_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := l16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3110_c7_9c48_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3107_c7_b83c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output := result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3107_c7_b83c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3103_c7_8b6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_8b6c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3100_c7_d108] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_return_output := result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3100_c7_d108_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_5592] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_5592_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3092_c7_6d3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_6d3c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3086_c2_26f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3170_l3082_DUPLICATE_6698 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3170_l3082_DUPLICATE_6698_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c2_26f1_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3170_l3082_DUPLICATE_6698_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3170_l3082_DUPLICATE_6698_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
