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
-- Submodules: 63
entity swp_0CLK_9ff5fd8d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_9ff5fd8d;
architecture arch of swp_0CLK_9ff5fd8d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2778_c6_935b]
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_9bc0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2778_c2_8ef7]
signal t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2778_c2_8ef7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c2_8ef7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2778_c2_8ef7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c2_8ef7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2778_c2_8ef7]
signal result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2778_c2_8ef7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2778_c2_8ef7]
signal n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2779_c3_a173[uxn_opcodes_h_l2779_c3_a173]
signal printf_uxn_opcodes_h_l2779_c3_a173_uxn_opcodes_h_l2779_c3_a173_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2783_c11_60bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2783_c7_54bc]
signal t8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2783_c7_54bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2783_c7_54bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2783_c7_54bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2783_c7_54bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2783_c7_54bc]
signal result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2783_c7_54bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2783_c7_54bc]
signal n8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2786_c11_a77d]
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2786_c7_3e57]
signal t8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2786_c7_3e57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2786_c7_3e57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2786_c7_3e57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2786_c7_3e57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2786_c7_3e57]
signal result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2786_c7_3e57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2786_c7_3e57]
signal n8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2790_c11_514b]
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2790_c7_33c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2790_c7_33c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2790_c7_33c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2790_c7_33c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2790_c7_33c9]
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2790_c7_33c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2790_c7_33c9]
signal n8_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2793_c11_c9a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2793_c7_672a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2793_c7_672a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2793_c7_672a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2793_c7_672a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2793_c7_672a]
signal result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2793_c7_672a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2793_c7_672a]
signal n8_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2796_c32_57a5]
signal BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2796_c32_c548]
signal BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2796_c32_582f]
signal MUX_uxn_opcodes_h_l2796_c32_582f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2796_c32_582f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2796_c32_582f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2796_c32_582f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2798_c11_9beb]
signal BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2798_c7_f835]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2798_c7_f835]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2798_c7_f835]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2798_c7_f835]
signal result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2798_c7_f835]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2804_c11_4193]
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2804_c7_7838]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2804_c7_7838]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2804_c7_7838]
signal result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2804_c7_7838]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2808_c11_b316]
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2808_c7_b76a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2808_c7_b76a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b
BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_left,
BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_right,
BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_return_output);

-- t8_MUX_uxn_opcodes_h_l2778_c2_8ef7
t8_MUX_uxn_opcodes_h_l2778_c2_8ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond,
t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue,
t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse,
t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7
result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

-- n8_MUX_uxn_opcodes_h_l2778_c2_8ef7
n8_MUX_uxn_opcodes_h_l2778_c2_8ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond,
n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue,
n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse,
n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

-- printf_uxn_opcodes_h_l2779_c3_a173_uxn_opcodes_h_l2779_c3_a173
printf_uxn_opcodes_h_l2779_c3_a173_uxn_opcodes_h_l2779_c3_a173 : entity work.printf_uxn_opcodes_h_l2779_c3_a173_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2779_c3_a173_uxn_opcodes_h_l2779_c3_a173_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output);

-- t8_MUX_uxn_opcodes_h_l2783_c7_54bc
t8_MUX_uxn_opcodes_h_l2783_c7_54bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond,
t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue,
t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse,
t8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc
result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output);

-- n8_MUX_uxn_opcodes_h_l2783_c7_54bc
n8_MUX_uxn_opcodes_h_l2783_c7_54bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond,
n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue,
n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse,
n8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_left,
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_right,
BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output);

-- t8_MUX_uxn_opcodes_h_l2786_c7_3e57
t8_MUX_uxn_opcodes_h_l2786_c7_3e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond,
t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue,
t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse,
t8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57
result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_cond,
result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output);

-- n8_MUX_uxn_opcodes_h_l2786_c7_3e57
n8_MUX_uxn_opcodes_h_l2786_c7_3e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond,
n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue,
n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse,
n8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_left,
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_right,
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output);

-- n8_MUX_uxn_opcodes_h_l2790_c7_33c9
n8_MUX_uxn_opcodes_h_l2790_c7_33c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2790_c7_33c9_cond,
n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue,
n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse,
n8_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5
BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a
result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output);

-- n8_MUX_uxn_opcodes_h_l2793_c7_672a
n8_MUX_uxn_opcodes_h_l2793_c7_672a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2793_c7_672a_cond,
n8_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue,
n8_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse,
n8_MUX_uxn_opcodes_h_l2793_c7_672a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5
BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_left,
BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_right,
BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548
BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_left,
BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_right,
BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_return_output);

-- MUX_uxn_opcodes_h_l2796_c32_582f
MUX_uxn_opcodes_h_l2796_c32_582f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2796_c32_582f_cond,
MUX_uxn_opcodes_h_l2796_c32_582f_iftrue,
MUX_uxn_opcodes_h_l2796_c32_582f_iffalse,
MUX_uxn_opcodes_h_l2796_c32_582f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb
BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_left,
BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_right,
BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835
result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835
result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835
result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_cond,
result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835
result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_left,
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_right,
BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838
result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_cond,
result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_left,
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_right,
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_return_output,
 t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
 n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output,
 t8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output,
 n8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output,
 t8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output,
 n8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output,
 n8_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output,
 n8_MUX_uxn_opcodes_h_l2793_c7_672a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_return_output,
 MUX_uxn_opcodes_h_l2796_c32_582f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2780_c3_8178 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2779_c3_a173_uxn_opcodes_h_l2779_c3_a173_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_9202 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_c30c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_8580 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2796_c32_582f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2796_c32_582f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2796_c32_582f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2796_c32_582f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_d886 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_5f86 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_DUPLICATE_9b27_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2786_l2783_l2778_l2798_DUPLICATE_3335_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2804_l2793_DUPLICATE_76b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2813_l2774_DUPLICATE_866e_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_d886 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2801_c3_d886;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_5f86 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_5f86;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_8580 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_8580;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2796_c32_582f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2796_c32_582f_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2780_c3_8178 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2780_c3_8178;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_c30c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_c30c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_9202 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_9202;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l2796_c32_57a5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_left;
     BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_return_output := BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2778_c6_935b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2786_c11_a77d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2804_l2793_DUPLICATE_76b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2804_l2793_DUPLICATE_76b4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_DUPLICATE_9b27 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_DUPLICATE_9b27_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2783_c11_60bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2793_c11_c9a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2804_c11_4193] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_left;
     BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output := BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2798_c11_9beb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2808_c11_b316] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_left;
     BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_return_output := BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2786_l2783_l2778_l2798_DUPLICATE_3335 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2786_l2783_l2778_l2798_DUPLICATE_3335_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2790_c11_514b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2796_c32_57a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c6_935b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2783_c11_60bb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2786_c11_a77d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_514b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c11_c9a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2798_c11_9beb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2804_c11_4193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_b316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_DUPLICATE_9b27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_DUPLICATE_9b27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_DUPLICATE_9b27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_DUPLICATE_9b27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_DUPLICATE_9b27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2804_l2798_DUPLICATE_1d03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2786_l2783_l2778_l2798_DUPLICATE_3335_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2786_l2783_l2778_l2798_DUPLICATE_3335_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2786_l2783_l2778_l2798_DUPLICATE_3335_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2786_l2783_l2778_l2798_DUPLICATE_3335_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2786_l2783_l2778_l2798_DUPLICATE_3335_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2808_l2778_l2804_DUPLICATE_28a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2804_l2793_DUPLICATE_76b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2804_l2793_DUPLICATE_76b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2793_l2790_l2786_l2783_l2778_l2804_DUPLICATE_cca9_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2796_c32_c548] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_left;
     BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_return_output := BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2778_c1_9bc0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2808_c7_b76a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2804_c7_7838] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_return_output := result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2808_c7_b76a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2804_c7_7838] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_return_output;

     -- n8_MUX[uxn_opcodes_h_l2793_c7_672a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2793_c7_672a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_cond;
     n8_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue;
     n8_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_return_output := n8_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2798_c7_f835] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;

     -- t8_MUX[uxn_opcodes_h_l2786_c7_3e57] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond <= VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond;
     t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue;
     t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output := t8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2796_c32_582f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2796_c32_c548_return_output;
     VAR_printf_uxn_opcodes_h_l2779_c3_a173_uxn_opcodes_h_l2779_c3_a173_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2778_c1_9bc0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_b76a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2804_c7_7838_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2804_c7_7838_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2804_c7_7838] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_return_output;

     -- MUX[uxn_opcodes_h_l2796_c32_582f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2796_c32_582f_cond <= VAR_MUX_uxn_opcodes_h_l2796_c32_582f_cond;
     MUX_uxn_opcodes_h_l2796_c32_582f_iftrue <= VAR_MUX_uxn_opcodes_h_l2796_c32_582f_iftrue;
     MUX_uxn_opcodes_h_l2796_c32_582f_iffalse <= VAR_MUX_uxn_opcodes_h_l2796_c32_582f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2796_c32_582f_return_output := MUX_uxn_opcodes_h_l2796_c32_582f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2790_c7_33c9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2790_c7_33c9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_cond;
     n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue;
     n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output := n8_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2798_c7_f835] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_return_output := result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;

     -- t8_MUX[uxn_opcodes_h_l2783_c7_54bc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond;
     t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue;
     t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output := t8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;

     -- printf_uxn_opcodes_h_l2779_c3_a173[uxn_opcodes_h_l2779_c3_a173] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2779_c3_a173_uxn_opcodes_h_l2779_c3_a173_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2779_c3_a173_uxn_opcodes_h_l2779_c3_a173_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2804_c7_7838] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2798_c7_f835] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2793_c7_672a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue := VAR_MUX_uxn_opcodes_h_l2796_c32_582f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2804_c7_7838_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2804_c7_7838_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2790_c7_33c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2798_c7_f835] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;

     -- t8_MUX[uxn_opcodes_h_l2778_c2_8ef7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond;
     t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue;
     t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output := t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2786_c7_3e57] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond <= VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_cond;
     n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue;
     n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output := n8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2793_c7_672a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2798_c7_f835] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2793_c7_672a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2793_c7_672a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2798_c7_f835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2790_c7_33c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;

     -- n8_MUX[uxn_opcodes_h_l2783_c7_54bc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_cond;
     n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue;
     n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output := n8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2790_c7_33c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2786_c7_3e57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2793_c7_672a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2793_c7_672a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2790_c7_33c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c7_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2786_c7_3e57] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output := result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2786_c7_3e57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2790_c7_33c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2790_c7_33c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2783_c7_54bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;

     -- n8_MUX[uxn_opcodes_h_l2778_c2_8ef7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond;
     n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue;
     n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output := n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2786_c7_3e57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_33c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2786_c7_3e57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2778_c2_8ef7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2786_c7_3e57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2783_c7_54bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2783_c7_54bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2783_c7_54bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2786_c7_3e57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c2_8ef7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2778_c2_8ef7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2783_c7_54bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2778_c2_8ef7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2783_c7_54bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2783_c7_54bc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c2_8ef7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2778_c2_8ef7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2813_l2774_DUPLICATE_866e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2813_l2774_DUPLICATE_866e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c2_8ef7_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2813_l2774_DUPLICATE_866e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2813_l2774_DUPLICATE_866e_return_output;
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
