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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 66
entity sft_0CLK_c01cd3f8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_c01cd3f8;
architecture arch of sft_0CLK_c01cd3f8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2408_c6_21fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2408_c2_713f]
signal tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2408_c2_713f]
signal n8_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2408_c2_713f]
signal t8_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2408_c2_713f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2408_c2_713f]
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2408_c2_713f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2408_c2_713f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2408_c2_713f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2408_c2_713f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2413_c11_0a11]
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2413_c7_f110]
signal tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2413_c7_f110]
signal n8_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2413_c7_f110]
signal t8_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2413_c7_f110]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2413_c7_f110]
signal result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2413_c7_f110]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2413_c7_f110]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2413_c7_f110]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2413_c7_f110]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_cf6a]
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal n8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal t8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_97d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_36f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2420_c7_9391]
signal tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2420_c7_9391]
signal n8_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_9391]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2420_c7_9391]
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_9391]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c7_9391]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_9391]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_9391]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2423_c11_765f]
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2423_c7_dd63]
signal tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2423_c7_dd63]
signal n8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2423_c7_dd63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2423_c7_dd63]
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2423_c7_dd63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2423_c7_dd63]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2423_c7_dd63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2423_c7_dd63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2426_c32_6e1c]
signal BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2426_c32_ff55]
signal BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2426_c32_fcac]
signal MUX_uxn_opcodes_h_l2426_c32_fcac_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2426_c32_fcac_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2426_c32_fcac_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2426_c32_fcac_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2428_c11_b1ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2428_c7_fa0f]
signal tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2428_c7_fa0f]
signal result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2428_c7_fa0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2428_c7_fa0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2428_c7_fa0f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2428_c7_fa0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2429_c18_a524]
signal BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2429_c11_3eb5]
signal BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2429_c34_d5a8]
signal CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2429_c11_1501]
signal BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2435_c11_5bae]
signal BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2435_c7_28de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2435_c7_28de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe
BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2408_c2_713f
tmp8_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- n8_MUX_uxn_opcodes_h_l2408_c2_713f
n8_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
n8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
n8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
n8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- t8_MUX_uxn_opcodes_h_l2408_c2_713f
t8_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
t8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
t8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
t8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_left,
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_right,
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2413_c7_f110
tmp8_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- n8_MUX_uxn_opcodes_h_l2413_c7_f110
n8_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
n8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
n8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
n8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- t8_MUX_uxn_opcodes_h_l2413_c7_f110
t8_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
t8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
t8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
t8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_left,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_right,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4
tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- n8_MUX_uxn_opcodes_h_l2416_c7_97d4
n8_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
n8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- t8_MUX_uxn_opcodes_h_l2416_c7_97d4
t8_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
t8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2420_c7_9391
tmp8_MUX_uxn_opcodes_h_l2420_c7_9391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_cond,
tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue,
tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse,
tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output);

-- n8_MUX_uxn_opcodes_h_l2420_c7_9391
n8_MUX_uxn_opcodes_h_l2420_c7_9391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2420_c7_9391_cond,
n8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue,
n8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse,
n8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_cond,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_left,
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_right,
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63
tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond,
tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue,
tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse,
tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output);

-- n8_MUX_uxn_opcodes_h_l2423_c7_dd63
n8_MUX_uxn_opcodes_h_l2423_c7_dd63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond,
n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue,
n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse,
n8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_cond,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c
BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_left,
BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_right,
BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55
BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_left,
BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_right,
BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_return_output);

-- MUX_uxn_opcodes_h_l2426_c32_fcac
MUX_uxn_opcodes_h_l2426_c32_fcac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2426_c32_fcac_cond,
MUX_uxn_opcodes_h_l2426_c32_fcac_iftrue,
MUX_uxn_opcodes_h_l2426_c32_fcac_iffalse,
MUX_uxn_opcodes_h_l2426_c32_fcac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea
BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f
tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond,
tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue,
tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse,
tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524
BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_left,
BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_right,
BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5
BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_left,
BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_right,
BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8
CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_x,
CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501
BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_left,
BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_right,
BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae
BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_left,
BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_right,
BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output,
 tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 n8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 t8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output,
 tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 n8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 t8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output,
 tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 n8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 t8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output,
 tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output,
 n8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output,
 tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output,
 n8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_return_output,
 MUX_uxn_opcodes_h_l2426_c32_fcac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output,
 tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_return_output,
 CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_83f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_313b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_9466 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_54f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2432_c3_1203 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_DUPLICATE_8245_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2428_l2420_l2416_l2413_l2408_DUPLICATE_614d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_34eb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2440_l2404_DUPLICATE_bcae_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_313b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_313b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2432_c3_1203 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2432_c3_1203;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_83f7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_83f7;
     VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_right := to_unsigned(15, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_9466 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_9466;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_54f3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_54f3;
     VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_DUPLICATE_8245 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_DUPLICATE_8245_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_34eb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_34eb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2423_c11_765f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_cf6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2429_c34_d5a8] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_return_output := CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2435_c11_5bae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2428_l2420_l2416_l2413_l2408_DUPLICATE_614d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2428_l2420_l2416_l2413_l2408_DUPLICATE_614d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2408_c6_21fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2429_c18_a524] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_left;
     BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_return_output := BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2413_c11_0a11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_left;
     BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output := BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2428_c11_b1ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2426_c32_6e1c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_left;
     BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_return_output := BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_36f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_6e1c_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_a524_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_21fe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_0a11_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_cf6a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_36f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_765f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_b1ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_5bae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_DUPLICATE_8245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_DUPLICATE_8245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_DUPLICATE_8245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_DUPLICATE_8245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_DUPLICATE_8245_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2435_DUPLICATE_17d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2428_l2420_l2416_l2413_l2408_DUPLICATE_614d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2428_l2420_l2416_l2413_l2408_DUPLICATE_614d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2428_l2420_l2416_l2413_l2408_DUPLICATE_614d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2428_l2420_l2416_l2413_l2408_DUPLICATE_614d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2428_l2420_l2416_l2413_l2408_DUPLICATE_614d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2423_l2420_l2416_l2413_l2408_l2435_DUPLICATE_10c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_34eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_34eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2428_l2423_l2420_l2416_l2413_l2408_DUPLICATE_c59d_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_right := VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_d5a8_return_output;
     -- t8_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := t8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2435_c7_28de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_return_output;

     -- n8_MUX[uxn_opcodes_h_l2423_c7_dd63] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond <= VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond;
     n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue;
     n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output := n8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2429_c11_3eb5] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_left;
     BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_return_output := BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2426_c32_ff55] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_left;
     BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_return_output := BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2435_c7_28de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2428_c7_fa0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2428_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_ff55_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_3eb5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_28de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_28de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l2429_c11_1501] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_left;
     BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_return_output := BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_return_output;

     -- t8_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     t8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     t8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := t8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2423_c7_dd63] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2428_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2423_c7_dd63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2428_c7_fa0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2420_c7_9391] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2420_c7_9391_cond <= VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_cond;
     n8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue;
     n8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output := n8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;

     -- MUX[uxn_opcodes_h_l2426_c32_fcac] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2426_c32_fcac_cond <= VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_cond;
     MUX_uxn_opcodes_h_l2426_c32_fcac_iftrue <= VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_iftrue;
     MUX_uxn_opcodes_h_l2426_c32_fcac_iffalse <= VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_return_output := MUX_uxn_opcodes_h_l2426_c32_fcac_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_1501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue := VAR_MUX_uxn_opcodes_h_l2426_c32_fcac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     -- n8_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := n8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c7_9391] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_9391] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;

     -- t8_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     t8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     t8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := t8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2423_c7_dd63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2428_c7_fa0f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2428_c7_fa0f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_cond;
     tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output := tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2423_c7_dd63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2423_c7_dd63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_fa0f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_9391] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2423_c7_dd63] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_cond;
     tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output := tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2423_c7_dd63] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output := result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_9391] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_9391] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     n8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     n8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := n8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_dd63_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2420_c7_9391] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_cond;
     tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output := tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     n8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     n8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := n8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2420_c7_9391] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_return_output := result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_9391_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2416_c7_97d4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_cond;
     tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output := tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_97d4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2413_c7_f110] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_cond;
     tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output := tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_f110_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2408_c2_713f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_713f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2440_l2404_DUPLICATE_bcae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2440_l2404_DUPLICATE_bcae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_713f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_713f_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2440_l2404_DUPLICATE_bcae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2440_l2404_DUPLICATE_bcae_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
