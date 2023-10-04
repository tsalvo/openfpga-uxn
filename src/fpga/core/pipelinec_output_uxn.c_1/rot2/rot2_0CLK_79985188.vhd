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
-- BIN_OP_EQ[uxn_opcodes_h_l2475_c6_59d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2475_c1_2777]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2475_c2_4227]
signal l16_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2475_c2_4227]
signal t16_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2475_c2_4227]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2475_c2_4227]
signal result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2475_c2_4227]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2475_c2_4227]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2475_c2_4227]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2475_c2_4227]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2475_c2_4227]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2475_c2_4227]
signal n16_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2476_c3_f7d7[uxn_opcodes_h_l2476_c3_f7d7]
signal printf_uxn_opcodes_h_l2476_c3_f7d7_uxn_opcodes_h_l2476_c3_f7d7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2481_c11_75c7]
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2481_c7_9033]
signal l16_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2481_c7_9033]
signal t16_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2481_c7_9033]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2481_c7_9033]
signal result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2481_c7_9033]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2481_c7_9033]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c7_9033]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c7_9033]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2481_c7_9033]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2481_c7_9033]
signal n16_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_bfbf]
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2484_c7_688f]
signal l16_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2484_c7_688f]
signal t16_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c7_688f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2484_c7_688f]
signal result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2484_c7_688f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_688f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_688f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c7_688f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2484_c7_688f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2484_c7_688f]
signal n16_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_ed53]
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal l16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal t16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2489_c7_e49d]
signal n16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2492_c11_98fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2492_c7_b6a8]
signal n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2493_c3_09a9]
signal BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2496_c11_e7df]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal l16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c7_aa09]
signal n16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2499_c11_8b2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal l16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2499_c7_28f8]
signal n16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_89f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2504_c7_943d]
signal l16_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_943d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2504_c7_943d]
signal result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_943d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2504_c7_943d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_943d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_943d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2504_c7_943d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2504_c7_943d]
signal n16_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2507_c11_3844]
signal BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2507_c7_463e]
signal l16_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2507_c7_463e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2507_c7_463e]
signal result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2507_c7_463e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2507_c7_463e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2507_c7_463e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2507_c7_463e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2507_c7_463e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2507_c7_463e]
signal n16_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2508_c3_0c84]
signal BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2511_c11_de6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2511_c7_96b9]
signal l16_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2511_c7_96b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2511_c7_96b9]
signal result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2511_c7_96b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2511_c7_96b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2511_c7_96b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2511_c7_96b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2511_c7_96b9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2514_c11_6e90]
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2514_c7_6575]
signal l16_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2514_c7_6575]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2514_c7_6575]
signal result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2514_c7_6575]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2514_c7_6575]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2514_c7_6575]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2514_c7_6575]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2514_c7_6575]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2519_c11_5bc4]
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2519_c7_cf38]
signal l16_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2519_c7_cf38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2519_c7_cf38]
signal result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2519_c7_cf38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2519_c7_cf38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2519_c7_cf38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2519_c7_cf38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2519_c7_cf38]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_27c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2522_c7_4649]
signal l16_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2522_c7_4649]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2522_c7_4649]
signal result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_4649]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_4649]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_4649]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_4649]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2522_c7_4649]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2523_c3_8bd8]
signal BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2526_c32_ede8]
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2526_c32_28e1]
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2526_c32_71a0]
signal MUX_uxn_opcodes_h_l2526_c32_71a0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_71a0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_71a0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_71a0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2528_c11_a8c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2528_c7_9ba2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2528_c7_9ba2]
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c7_9ba2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2528_c7_9ba2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2528_c7_9ba2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_3e39]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_e74d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2534_c7_e74d]
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_e74d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_e74d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2536_c34_6915]
signal CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2538_c11_55ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2538_c7_a26b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2538_c7_a26b]
signal result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2538_c7_a26b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2538_c7_a26b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2542_c11_b848]
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2542_c7_fe10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2542_c7_fe10]
signal result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2542_c7_fe10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2542_c7_fe10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2544_c34_7ba5]
signal CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2546_c11_8920]
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2546_c7_f745]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2546_c7_f745]
signal result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2546_c7_f745]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2546_c7_f745]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_d850]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_4a2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2550_c7_4a2c]
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_4a2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2550_c7_4a2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2552_c34_494b]
signal CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2554_c11_5927]
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2554_c7_aa68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2554_c7_aa68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0
BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_return_output);

-- l16_MUX_uxn_opcodes_h_l2475_c2_4227
l16_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
l16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
l16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
l16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- t16_MUX_uxn_opcodes_h_l2475_c2_4227
t16_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
t16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
t16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
t16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227
result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- n16_MUX_uxn_opcodes_h_l2475_c2_4227
n16_MUX_uxn_opcodes_h_l2475_c2_4227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2475_c2_4227_cond,
n16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue,
n16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse,
n16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

-- printf_uxn_opcodes_h_l2476_c3_f7d7_uxn_opcodes_h_l2476_c3_f7d7
printf_uxn_opcodes_h_l2476_c3_f7d7_uxn_opcodes_h_l2476_c3_f7d7 : entity work.printf_uxn_opcodes_h_l2476_c3_f7d7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2476_c3_f7d7_uxn_opcodes_h_l2476_c3_f7d7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_left,
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_right,
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output);

-- l16_MUX_uxn_opcodes_h_l2481_c7_9033
l16_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
l16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
l16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
l16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- t16_MUX_uxn_opcodes_h_l2481_c7_9033
t16_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
t16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
t16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
t16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033
result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- n16_MUX_uxn_opcodes_h_l2481_c7_9033
n16_MUX_uxn_opcodes_h_l2481_c7_9033 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2481_c7_9033_cond,
n16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue,
n16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse,
n16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_left,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_right,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output);

-- l16_MUX_uxn_opcodes_h_l2484_c7_688f
l16_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
l16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
l16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
l16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- t16_MUX_uxn_opcodes_h_l2484_c7_688f
t16_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
t16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
t16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
t16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f
result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f
result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- n16_MUX_uxn_opcodes_h_l2484_c7_688f
n16_MUX_uxn_opcodes_h_l2484_c7_688f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2484_c7_688f_cond,
n16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue,
n16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse,
n16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_left,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_right,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output);

-- l16_MUX_uxn_opcodes_h_l2489_c7_e49d
l16_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
l16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- t16_MUX_uxn_opcodes_h_l2489_c7_e49d
t16_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
t16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d
result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d
result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- n16_MUX_uxn_opcodes_h_l2489_c7_e49d
n16_MUX_uxn_opcodes_h_l2489_c7_e49d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond,
n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue,
n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse,
n16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd
BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output);

-- l16_MUX_uxn_opcodes_h_l2492_c7_b6a8
l16_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- t16_MUX_uxn_opcodes_h_l2492_c7_b6a8
t16_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8
result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8
result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8
result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- n16_MUX_uxn_opcodes_h_l2492_c7_b6a8
n16_MUX_uxn_opcodes_h_l2492_c7_b6a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond,
n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue,
n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse,
n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9
BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_left,
BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_right,
BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output);

-- l16_MUX_uxn_opcodes_h_l2496_c7_aa09
l16_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
l16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c7_aa09
n16_MUX_uxn_opcodes_h_l2496_c7_aa09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond,
n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output);

-- l16_MUX_uxn_opcodes_h_l2499_c7_28f8
l16_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
l16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- n16_MUX_uxn_opcodes_h_l2499_c7_28f8
n16_MUX_uxn_opcodes_h_l2499_c7_28f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond,
n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue,
n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse,
n16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output);

-- l16_MUX_uxn_opcodes_h_l2504_c7_943d
l16_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
l16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
l16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
l16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d
result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- n16_MUX_uxn_opcodes_h_l2504_c7_943d
n16_MUX_uxn_opcodes_h_l2504_c7_943d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2504_c7_943d_cond,
n16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue,
n16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse,
n16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844
BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_left,
BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_right,
BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output);

-- l16_MUX_uxn_opcodes_h_l2507_c7_463e
l16_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
l16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
l16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
l16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e
result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e
result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e
result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- n16_MUX_uxn_opcodes_h_l2507_c7_463e
n16_MUX_uxn_opcodes_h_l2507_c7_463e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2507_c7_463e_cond,
n16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue,
n16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse,
n16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84
BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_left,
BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_right,
BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output);

-- l16_MUX_uxn_opcodes_h_l2511_c7_96b9
l16_MUX_uxn_opcodes_h_l2511_c7_96b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2511_c7_96b9_cond,
l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue,
l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse,
l16_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9
result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_left,
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_right,
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output);

-- l16_MUX_uxn_opcodes_h_l2514_c7_6575
l16_MUX_uxn_opcodes_h_l2514_c7_6575 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2514_c7_6575_cond,
l16_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue,
l16_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse,
l16_MUX_uxn_opcodes_h_l2514_c7_6575_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575
result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_cond,
result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575
result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4
BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_left,
BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_right,
BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output);

-- l16_MUX_uxn_opcodes_h_l2519_c7_cf38
l16_MUX_uxn_opcodes_h_l2519_c7_cf38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2519_c7_cf38_cond,
l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue,
l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse,
l16_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38
result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_cond,
result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38
result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output);

-- l16_MUX_uxn_opcodes_h_l2522_c7_4649
l16_MUX_uxn_opcodes_h_l2522_c7_4649 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2522_c7_4649_cond,
l16_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue,
l16_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse,
l16_MUX_uxn_opcodes_h_l2522_c7_4649_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649
result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649
result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_cond,
result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649
result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8
BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_left,
BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_right,
BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8
BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_left,
BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_right,
BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1
BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_left,
BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_right,
BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_return_output);

-- MUX_uxn_opcodes_h_l2526_c32_71a0
MUX_uxn_opcodes_h_l2526_c32_71a0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2526_c32_71a0_cond,
MUX_uxn_opcodes_h_l2526_c32_71a0_iftrue,
MUX_uxn_opcodes_h_l2526_c32_71a0_iffalse,
MUX_uxn_opcodes_h_l2526_c32_71a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2536_c34_6915
CONST_SR_8_uxn_opcodes_h_l2536_c34_6915 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_x,
CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b
result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_left,
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_right,
BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10
result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_cond,
result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5
CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_x,
CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_left,
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_right,
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745
result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_cond,
result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2552_c34_494b
CONST_SR_8_uxn_opcodes_h_l2552_c34_494b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_x,
CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_left,
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_right,
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20
CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_return_output,
 l16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 t16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 n16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output,
 l16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 t16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 n16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output,
 l16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 t16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 n16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output,
 l16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 t16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 n16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output,
 l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output,
 l16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output,
 l16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 n16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output,
 l16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 n16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output,
 l16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 n16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output,
 l16_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output,
 l16_MUX_uxn_opcodes_h_l2514_c7_6575_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output,
 l16_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output,
 l16_MUX_uxn_opcodes_h_l2522_c7_4649_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_return_output,
 MUX_uxn_opcodes_h_l2526_c32_71a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output,
 CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iffalse : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2478_c3_00a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2476_c3_f7d7_uxn_opcodes_h_l2476_c3_f7d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_14ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_1f28 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_d4f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2494_c3_ed06 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_32d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_9a42 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2505_c3_be08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2509_c3_55a4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_d415 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2517_c3_86ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_970f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_11e0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c24_3d05_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_7ca5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c24_aadd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_202c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2540_c24_68a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2543_c3_6b38 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2544_c24_14ea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_1a92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c24_f5a1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_4681 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2552_c24_78e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2500_l2515_l2523_l2493_l2508_l2485_DUPLICATE_0875_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2550_DUPLICATE_e9fb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2559_l2471_DUPLICATE_2d1c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_d4f0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_d4f0;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2509_c3_55a4 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2509_c3_55a4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_202c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_202c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_4681 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_4681;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_right := to_unsigned(14, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_d415 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_d415;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_right := to_unsigned(13, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_right := to_unsigned(19, 5);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_right := to_unsigned(18, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_9a42 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_9a42;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2517_c3_86ea := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2517_c3_86ea;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_right := to_unsigned(17, 5);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2505_c3_be08 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2505_c3_be08;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_11e0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_11e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2543_c3_6b38 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2543_c3_6b38;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_1f28 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_1f28;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_1a92 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_1a92;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2494_c3_ed06 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2494_c3_ed06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_7ca5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_7ca5;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_32d9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_32d9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_970f := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_970f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_right := to_unsigned(16, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2478_c3_00a1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2478_c3_00a1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_14ef := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_14ef;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2548_c24_f5a1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c24_f5a1_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2540_c24_68a5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2540_c24_68a5_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c11_e7df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_bfbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2532_c24_3d05] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c24_3d05_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2507_c11_3844] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_left;
     BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output := BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2500_l2515_l2523_l2493_l2508_l2485_DUPLICATE_0875 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2500_l2515_l2523_l2493_l2508_l2485_DUPLICATE_0875_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2542_c11_b848] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_left;
     BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output := BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2552_c34_494b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_return_output := CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_89f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_27c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2475_c6_59d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2492_c11_98fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2519_c11_5bc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2499_c11_8b2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2538_c11_55ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_ed53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2514_c11_6e90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_left;
     BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output := BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2481_c11_75c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2536_c34_6915] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_return_output := CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2526_c32_ede8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_left;
     BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_return_output := BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2550_DUPLICATE_e9fb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2550_DUPLICATE_e9fb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2511_c11_de6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2544_c34_7ba5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_return_output := CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2528_c11_a8c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2546_c11_8920] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_left;
     BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output := BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_3e39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2554_c11_5927] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_left;
     BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_return_output := BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_d850] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_ede8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c6_59d0_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_75c7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_bfbf_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_ed53_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2492_c11_98fd_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_e7df_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_8b2f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_89f6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2507_c11_3844_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_de6e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_6e90_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_5bc4_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_27c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_a8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_3e39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_55ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2542_c11_b848_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_8920_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_d850_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_5927_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2500_l2515_l2523_l2493_l2508_l2485_DUPLICATE_0875_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2500_l2515_l2523_l2493_l2508_l2485_DUPLICATE_0875_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2500_l2515_l2523_l2493_l2508_l2485_DUPLICATE_0875_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2500_l2515_l2523_l2493_l2508_l2485_DUPLICATE_0875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c24_3d05_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2540_c24_68a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2548_c24_f5a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2496_l2519_DUPLICATE_07f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2554_l2550_l2546_l2542_l2538_l2534_l2528_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_f1f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2528_l2499_l2475_l2496_l2519_DUPLICATE_71a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2496_l2519_DUPLICATE_b4bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2492_l2489_l2484_l2481_l2475_l2554_l2550_l2546_l2542_l2538_l2534_l2522_l2519_l2514_l2511_l2507_l2504_l2499_l2496_DUPLICATE_109b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2550_DUPLICATE_e9fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2550_DUPLICATE_e9fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2514_l2492_l2511_l2489_l2507_l2484_l2504_l2481_l2499_l2522_l2475_l2550_l2496_l2519_DUPLICATE_0816_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2526_c32_28e1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_left;
     BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_return_output := BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2554_c7_aa68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2536_c24_aadd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c24_aadd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c34_6915_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2493_c3_09a9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_left;
     BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_return_output := BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_4a2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2554_c7_aa68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2475_c1_2777] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2508_c3_0c84] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_left;
     BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_return_output := BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2544_c24_14ea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2544_c24_14ea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2544_c34_7ba5_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2523_c3_8bd8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_left;
     BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_return_output := BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2528_c7_9ba2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2522_c7_4649] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2552_c24_78e7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2552_c24_78e7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2552_c34_494b_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_28e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2493_c3_09a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2508_c3_0c84_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2523_c3_8bd8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c24_aadd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2544_c24_14ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2552_c24_78e7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2486_l2516_l2501_DUPLICATE_da20_return_output;
     VAR_printf_uxn_opcodes_h_l2476_c3_f7d7_uxn_opcodes_h_l2476_c3_f7d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2475_c1_2777_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2554_c7_aa68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output;
     -- printf_uxn_opcodes_h_l2476_c3_f7d7[uxn_opcodes_h_l2476_c3_f7d7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2476_c3_f7d7_uxn_opcodes_h_l2476_c3_f7d7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2476_c3_f7d7_uxn_opcodes_h_l2476_c3_f7d7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2522_c7_4649] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2519_c7_cf38] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;

     -- MUX[uxn_opcodes_h_l2526_c32_71a0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2526_c32_71a0_cond <= VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_cond;
     MUX_uxn_opcodes_h_l2526_c32_71a0_iftrue <= VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_iftrue;
     MUX_uxn_opcodes_h_l2526_c32_71a0_iffalse <= VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_return_output := MUX_uxn_opcodes_h_l2526_c32_71a0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2550_c7_4a2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     n16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     n16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := n16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2522_c7_4649] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2522_c7_4649_cond <= VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_cond;
     l16_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue;
     l16_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_return_output := l16_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2546_c7_f745] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_4a2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2550_c7_4a2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue := VAR_MUX_uxn_opcodes_h_l2526_c32_71a0_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_f745_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_4a2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     -- n16_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     n16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     n16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := n16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2546_c7_f745] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_return_output;

     -- t16_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := t16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2519_c7_cf38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2542_c7_fe10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2546_c7_f745] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2514_c7_6575] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2546_c7_f745] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_return_output := result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_4649] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;

     -- l16_MUX[uxn_opcodes_h_l2519_c7_cf38] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2519_c7_cf38_cond <= VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_cond;
     l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue;
     l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output := l16_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_f745_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2546_c7_f745_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2546_c7_f745_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     -- l16_MUX[uxn_opcodes_h_l2514_c7_6575] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2514_c7_6575_cond <= VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_cond;
     l16_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue;
     l16_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_return_output := l16_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;

     -- t16_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     t16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     t16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := t16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2538_c7_a26b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2542_c7_fe10] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output := result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2514_c7_6575] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;

     -- n16_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := n16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2542_c7_fe10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2519_c7_cf38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2511_c7_96b9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2542_c7_fe10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2542_c7_fe10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     -- n16_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := n16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2538_c7_a26b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_e74d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2514_c7_6575] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;

     -- t16_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     t16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     t16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := t16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2538_c7_a26b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2538_c7_a26b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2511_c7_96b9] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2511_c7_96b9_cond <= VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_cond;
     l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue;
     l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output := l16_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2511_c7_96b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2538_c7_a26b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_e74d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2511_c7_96b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2528_c7_9ba2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     l16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     l16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := l16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2534_c7_e74d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_e74d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     t16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     t16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := t16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_e74d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2528_c7_9ba2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     l16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     l16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := l16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_4649] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := n16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c7_9ba2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2528_c7_9ba2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_9ba2_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_4649] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_4649] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;

     -- l16_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := l16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     n16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     n16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := n16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2522_c7_4649] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_return_output := result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2519_c7_cf38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2522_c7_4649_return_output;
     -- n16_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     n16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     n16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := n16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2519_c7_cf38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2519_c7_cf38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2514_c7_6575] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- l16_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := l16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2519_c7_cf38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output := result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2519_c7_cf38_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- n16_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     n16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     n16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := n16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- l16_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2511_c7_96b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2514_c7_6575] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_return_output := result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2514_c7_6575] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2514_c7_6575] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2514_c7_6575_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2511_c7_96b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := l16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2511_c7_96b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2511_c7_96b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_96b9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- l16_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     l16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     l16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := l16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2507_c7_463e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2507_c7_463e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2504_c7_943d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;

     -- l16_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     l16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     l16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := l16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2504_c7_943d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- l16_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     l16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     l16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := l16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2499_c7_28f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_28f8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c7_aa09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_aa09_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2492_c7_b6a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2492_c7_b6a8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2489_c7_e49d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2489_c7_e49d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2484_c7_688f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2484_c7_688f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c7_9033] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_9033_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2475_c2_4227] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2559_l2471_DUPLICATE_2d1c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2559_l2471_DUPLICATE_2d1c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c2_4227_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c2_4227_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2559_l2471_DUPLICATE_2d1c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2559_l2471_DUPLICATE_2d1c_return_output;
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
