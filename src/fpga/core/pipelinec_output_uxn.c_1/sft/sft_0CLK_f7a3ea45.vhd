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
-- Submodules: 73
entity sft_0CLK_f7a3ea45 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_f7a3ea45;
architecture arch of sft_0CLK_f7a3ea45 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2573_c6_2560]
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2573_c1_bac2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal t8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal n8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2573_c2_0b67]
signal tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2574_c3_693c[uxn_opcodes_h_l2574_c3_693c]
signal printf_uxn_opcodes_h_l2574_c3_693c_uxn_opcodes_h_l2574_c3_693c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_2d7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2579_c7_0399]
signal t8_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2579_c7_0399]
signal n8_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_0399]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2579_c7_0399]
signal result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_0399]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_0399]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_0399]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_0399]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2579_c7_0399]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2579_c7_0399]
signal tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_ca5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2582_c7_eb1a]
signal tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_1b44]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2586_c7_ee1f]
signal tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_2011]
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2589_c7_bcf7]
signal tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2593_c32_004f]
signal BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2593_c32_4270]
signal BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2593_c32_7e8c]
signal MUX_uxn_opcodes_h_l2593_c32_7e8c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2593_c32_7e8c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2593_c32_7e8c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2593_c32_7e8c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2595_c11_407a]
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2595_c7_17a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2595_c7_17a3]
signal result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2595_c7_17a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2595_c7_17a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2595_c7_17a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2595_c7_17a3]
signal tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2596_c18_d750]
signal BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2596_c11_0fdd]
signal BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2596_c34_34ee]
signal CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2596_c11_c73c]
signal BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_f0f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_4fdf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_4fdf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560
BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_left,
BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_right,
BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_return_output);

-- t8_MUX_uxn_opcodes_h_l2573_c2_0b67
t8_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
t8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- n8_MUX_uxn_opcodes_h_l2573_c2_0b67
n8_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
n8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67
result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67
result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67
tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond,
tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue,
tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse,
tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

-- printf_uxn_opcodes_h_l2574_c3_693c_uxn_opcodes_h_l2574_c3_693c
printf_uxn_opcodes_h_l2574_c3_693c_uxn_opcodes_h_l2574_c3_693c : entity work.printf_uxn_opcodes_h_l2574_c3_693c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2574_c3_693c_uxn_opcodes_h_l2574_c3_693c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output);

-- t8_MUX_uxn_opcodes_h_l2579_c7_0399
t8_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
t8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
t8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
t8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- n8_MUX_uxn_opcodes_h_l2579_c7_0399
n8_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
n8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
n8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
n8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2579_c7_0399
tmp8_MUX_uxn_opcodes_h_l2579_c7_0399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_cond,
tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue,
tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse,
tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output);

-- t8_MUX_uxn_opcodes_h_l2582_c7_eb1a
t8_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- n8_MUX_uxn_opcodes_h_l2582_c7_eb1a
n8_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a
result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a
result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a
tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond,
tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue,
tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse,
tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output);

-- n8_MUX_uxn_opcodes_h_l2586_c7_ee1f
n8_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f
tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond,
tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue,
tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse,
tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_left,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_right,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output);

-- n8_MUX_uxn_opcodes_h_l2589_c7_bcf7
n8_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7
result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7
result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7
tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond,
tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue,
tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse,
tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f
BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_left,
BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_right,
BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270
BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_left,
BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_right,
BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_return_output);

-- MUX_uxn_opcodes_h_l2593_c32_7e8c
MUX_uxn_opcodes_h_l2593_c32_7e8c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2593_c32_7e8c_cond,
MUX_uxn_opcodes_h_l2593_c32_7e8c_iftrue,
MUX_uxn_opcodes_h_l2593_c32_7e8c_iffalse,
MUX_uxn_opcodes_h_l2593_c32_7e8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_left,
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_right,
BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3
result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3
tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_cond,
tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue,
tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse,
tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750
BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_left,
BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_right,
BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd
BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_left,
BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_right,
BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee
CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_x,
CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c
BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_left,
BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_right,
BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_return_output,
 t8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 n8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output,
 t8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 n8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output,
 t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output,
 n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output,
 n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_return_output,
 MUX_uxn_opcodes_h_l2593_c32_7e8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output,
 tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_return_output,
 CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_a453 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2574_c3_693c_uxn_opcodes_h_l2574_c3_693c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_711d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_b133 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_24bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_f6ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2586_l2582_l2579_l2573_l2595_DUPLICATE_817e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_DUPLICATE_72ea_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2586_l2579_l2589_l2582_DUPLICATE_26d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2589_l2595_DUPLICATE_ce3b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2607_l2569_DUPLICATE_b6d5_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_b133 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_b133;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_24bb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_24bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_f6ee := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_f6ee;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_a453 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_a453;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_711d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_711d;
     VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2595_c11_407a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2586_l2582_l2579_l2573_l2595_DUPLICATE_817e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2586_l2582_l2579_l2573_l2595_DUPLICATE_817e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_2011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_left;
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output := BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2596_c18_d750] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_left;
     BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_return_output := BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2573_c6_2560] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_left;
     BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output := BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2593_c32_004f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_left;
     BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_return_output := BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2589_l2595_DUPLICATE_ce3b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2589_l2595_DUPLICATE_ce3b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_2d7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_1b44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2586_l2579_l2589_l2582_DUPLICATE_26d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2586_l2579_l2589_l2582_DUPLICATE_26d8_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_f0f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_DUPLICATE_72ea LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_DUPLICATE_72ea_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_ca5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2596_c34_34ee] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_return_output := CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2593_c32_004f_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2596_c18_d750_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c6_2560_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_2d7c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_ca5a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_1b44_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_2011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2595_c11_407a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f0f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_DUPLICATE_72ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_DUPLICATE_72ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_DUPLICATE_72ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_DUPLICATE_72ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_DUPLICATE_72ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2602_l2595_DUPLICATE_8700_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2586_l2582_l2579_l2573_l2595_DUPLICATE_817e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2586_l2582_l2579_l2573_l2595_DUPLICATE_817e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2586_l2582_l2579_l2573_l2595_DUPLICATE_817e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2586_l2582_l2579_l2573_l2595_DUPLICATE_817e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2586_l2582_l2579_l2573_l2595_DUPLICATE_817e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2586_l2579_l2589_l2582_DUPLICATE_26d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2586_l2579_l2589_l2582_DUPLICATE_26d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2586_l2579_l2589_l2582_DUPLICATE_26d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2586_l2579_l2589_l2582_DUPLICATE_26d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2602_DUPLICATE_6563_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2589_l2595_DUPLICATE_ce3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2589_l2595_DUPLICATE_ce3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2589_l2586_l2582_l2579_l2573_l2595_DUPLICATE_d903_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_right := VAR_CONST_SR_4_uxn_opcodes_h_l2596_c34_34ee_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2595_c7_17a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2595_c7_17a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2596_c11_0fdd] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_left;
     BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_return_output := BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_return_output;

     -- n8_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2573_c1_bac2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_4fdf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2593_c32_4270] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_left;
     BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_return_output := BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_return_output;

     -- t8_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_4fdf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2593_c32_4270_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2596_c11_0fdd_return_output;
     VAR_printf_uxn_opcodes_h_l2574_c3_693c_uxn_opcodes_h_l2574_c3_693c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2573_c1_bac2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_4fdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     -- MUX[uxn_opcodes_h_l2593_c32_7e8c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2593_c32_7e8c_cond <= VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_cond;
     MUX_uxn_opcodes_h_l2593_c32_7e8c_iftrue <= VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_iftrue;
     MUX_uxn_opcodes_h_l2593_c32_7e8c_iffalse <= VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_return_output := MUX_uxn_opcodes_h_l2593_c32_7e8c_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2596_c11_c73c] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_left;
     BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_return_output := BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- t8_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     t8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     t8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := t8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- printf_uxn_opcodes_h_l2574_c3_693c[uxn_opcodes_h_l2574_c3_693c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2574_c3_693c_uxn_opcodes_h_l2574_c3_693c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2574_c3_693c_uxn_opcodes_h_l2574_c3_693c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2595_c7_17a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2595_c7_17a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2596_c11_c73c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue := VAR_MUX_uxn_opcodes_h_l2593_c32_7e8c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2595_c7_17a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := t8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2595_c7_17a3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_cond;
     tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output := tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2595_c7_17a3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     n8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     n8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := n8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2589_c7_bcf7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2589_c7_bcf7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- n8_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := n8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2586_c7_ee1f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2586_c7_ee1f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2582_c7_eb1a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_cond;
     tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output := tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2582_c7_eb1a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2579_c7_0399] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_cond;
     tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output := tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2579_c7_0399_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2573_c2_0b67] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output := result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2607_l2569_DUPLICATE_b6d5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2607_l2569_DUPLICATE_b6d5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2573_c2_0b67_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2607_l2569_DUPLICATE_b6d5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2607_l2569_DUPLICATE_b6d5_return_output;
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
