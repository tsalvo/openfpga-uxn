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
-- BIN_OP_EQ[uxn_opcodes_h_l2782_c6_b302]
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2782_c1_10bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2782_c2_c263]
signal n8_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2782_c2_c263]
signal t8_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2782_c2_c263]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2782_c2_c263]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2782_c2_c263]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2782_c2_c263]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2782_c2_c263]
signal result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2782_c2_c263]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2783_c3_f49c[uxn_opcodes_h_l2783_c3_f49c]
signal printf_uxn_opcodes_h_l2783_c3_f49c_uxn_opcodes_h_l2783_c3_f49c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2787_c11_683e]
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2787_c7_fc94]
signal n8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2787_c7_fc94]
signal t8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2787_c7_fc94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2787_c7_fc94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2787_c7_fc94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2787_c7_fc94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2787_c7_fc94]
signal result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2787_c7_fc94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2790_c11_ab23]
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2790_c7_b50c]
signal n8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2790_c7_b50c]
signal t8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2790_c7_b50c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2790_c7_b50c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2790_c7_b50c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2790_c7_b50c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2790_c7_b50c]
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2790_c7_b50c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_4b98]
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2794_c7_bec3]
signal n8_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_bec3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_bec3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_bec3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2794_c7_bec3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2794_c7_bec3]
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_bec3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2797_c11_a809]
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2797_c7_3ddc]
signal n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2797_c7_3ddc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2797_c7_3ddc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2797_c7_3ddc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2797_c7_3ddc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2797_c7_3ddc]
signal result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2797_c7_3ddc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2800_c32_a504]
signal BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2800_c32_d82d]
signal BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2800_c32_c91b]
signal MUX_uxn_opcodes_h_l2800_c32_c91b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2800_c32_c91b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2800_c32_c91b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2800_c32_c91b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_caca]
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2802_c7_7ea3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2802_c7_7ea3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_7ea3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2802_c7_7ea3]
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_7ea3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2808_c11_3dc9]
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2808_c7_47c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2808_c7_47c6]
signal result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2808_c7_47c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2808_c7_47c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2812_c11_4335]
signal BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2812_c7_d102]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2812_c7_d102]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302
BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_left,
BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_right,
BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_return_output);

-- n8_MUX_uxn_opcodes_h_l2782_c2_c263
n8_MUX_uxn_opcodes_h_l2782_c2_c263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2782_c2_c263_cond,
n8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue,
n8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse,
n8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

-- t8_MUX_uxn_opcodes_h_l2782_c2_c263
t8_MUX_uxn_opcodes_h_l2782_c2_c263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2782_c2_c263_cond,
t8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue,
t8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse,
t8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_cond,
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

-- printf_uxn_opcodes_h_l2783_c3_f49c_uxn_opcodes_h_l2783_c3_f49c
printf_uxn_opcodes_h_l2783_c3_f49c_uxn_opcodes_h_l2783_c3_f49c : entity work.printf_uxn_opcodes_h_l2783_c3_f49c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2783_c3_f49c_uxn_opcodes_h_l2783_c3_f49c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_left,
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_right,
BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output);

-- n8_MUX_uxn_opcodes_h_l2787_c7_fc94
n8_MUX_uxn_opcodes_h_l2787_c7_fc94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond,
n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue,
n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse,
n8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output);

-- t8_MUX_uxn_opcodes_h_l2787_c7_fc94
t8_MUX_uxn_opcodes_h_l2787_c7_fc94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond,
t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue,
t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse,
t8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_cond,
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_left,
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_right,
BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output);

-- n8_MUX_uxn_opcodes_h_l2790_c7_b50c
n8_MUX_uxn_opcodes_h_l2790_c7_b50c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond,
n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue,
n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse,
n8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output);

-- t8_MUX_uxn_opcodes_h_l2790_c7_b50c
t8_MUX_uxn_opcodes_h_l2790_c7_b50c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond,
t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue,
t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse,
t8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_left,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_right,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output);

-- n8_MUX_uxn_opcodes_h_l2794_c7_bec3
n8_MUX_uxn_opcodes_h_l2794_c7_bec3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2794_c7_bec3_cond,
n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue,
n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse,
n8_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_left,
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_right,
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output);

-- n8_MUX_uxn_opcodes_h_l2797_c7_3ddc
n8_MUX_uxn_opcodes_h_l2797_c7_3ddc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond,
n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue,
n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse,
n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504
BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_left,
BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_right,
BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d
BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_left,
BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_right,
BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_return_output);

-- MUX_uxn_opcodes_h_l2800_c32_c91b
MUX_uxn_opcodes_h_l2800_c32_c91b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2800_c32_c91b_cond,
MUX_uxn_opcodes_h_l2800_c32_c91b_iftrue,
MUX_uxn_opcodes_h_l2800_c32_c91b_iffalse,
MUX_uxn_opcodes_h_l2800_c32_c91b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_left,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_right,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_left,
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_right,
BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335
BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_left,
BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_right,
BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_return_output,
 n8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
 t8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output,
 n8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output,
 t8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output,
 n8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output,
 t8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output,
 n8_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output,
 n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_return_output,
 MUX_uxn_opcodes_h_l2800_c32_c91b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_c4a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2783_c3_f49c_uxn_opcodes_h_l2783_c3_f49c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_8b7f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2792_c3_fb5d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2795_c3_4d88 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_11e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2809_c3_947d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2802_l2794_DUPLICATE_5252_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2797_l2794_DUPLICATE_8a55_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_36c5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2778_l2817_DUPLICATE_51bf_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_c4a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2784_c3_c4a0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_11e7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2805_c3_11e7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2795_c3_4d88 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2795_c3_4d88;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2792_c3_fb5d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2792_c3_fb5d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2809_c3_947d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2809_c3_947d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_8b7f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2788_c3_8b7f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_4b98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_left;
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output := BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2787_c11_683e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_caca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2797_c11_a809] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_left;
     BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output := BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2797_l2794_DUPLICATE_8a55 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2797_l2794_DUPLICATE_8a55_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2812_c11_4335] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_left;
     BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_return_output := BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2808_c11_3dc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2802_l2794_DUPLICATE_5252 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2802_l2794_DUPLICATE_5252_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2790_c11_ab23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_left;
     BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output := BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_36c5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_36c5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2800_c32_a504] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_left;
     BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_return_output := BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2782_c6_b302] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_left;
     BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output := BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2800_c32_a504_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2782_c6_b302_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2787_c11_683e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2790_c11_ab23_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_4b98_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_a809_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_caca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2808_c11_3dc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2812_c11_4335_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2797_l2794_DUPLICATE_8a55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2797_l2794_DUPLICATE_8a55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2797_l2794_DUPLICATE_8a55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2797_l2794_DUPLICATE_8a55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2797_l2794_DUPLICATE_8a55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2808_l2802_l2797_l2794_DUPLICATE_2a1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2802_l2794_DUPLICATE_5252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2802_l2794_DUPLICATE_5252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2802_l2794_DUPLICATE_5252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2802_l2794_DUPLICATE_5252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2802_l2794_DUPLICATE_5252_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2790_l2787_l2812_l2782_l2808_l2797_l2794_DUPLICATE_bf28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_36c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2797_l2808_DUPLICATE_36c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2790_l2787_l2782_l2808_l2797_l2794_DUPLICATE_984c_return_output;
     -- n8_MUX[uxn_opcodes_h_l2797_c7_3ddc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond;
     n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue;
     n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output := n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2802_c7_7ea3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2812_c7_d102] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2800_c32_d82d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_left;
     BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_return_output := BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2808_c7_47c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2782_c1_10bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2812_c7_d102] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2808_c7_47c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output;

     -- t8_MUX[uxn_opcodes_h_l2790_c7_b50c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond;
     t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue;
     t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output := t8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2800_c32_d82d_return_output;
     VAR_printf_uxn_opcodes_h_l2783_c3_f49c_uxn_opcodes_h_l2783_c3_f49c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2782_c1_10bd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2812_c7_d102_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2812_c7_d102_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;
     -- MUX[uxn_opcodes_h_l2800_c32_c91b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2800_c32_c91b_cond <= VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_cond;
     MUX_uxn_opcodes_h_l2800_c32_c91b_iftrue <= VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_iftrue;
     MUX_uxn_opcodes_h_l2800_c32_c91b_iffalse <= VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_return_output := MUX_uxn_opcodes_h_l2800_c32_c91b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2797_c7_3ddc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2808_c7_47c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_7ea3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;

     -- printf_uxn_opcodes_h_l2783_c3_f49c[uxn_opcodes_h_l2783_c3_f49c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2783_c3_f49c_uxn_opcodes_h_l2783_c3_f49c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2783_c3_f49c_uxn_opcodes_h_l2783_c3_f49c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2808_c7_47c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output;

     -- n8_MUX[uxn_opcodes_h_l2794_c7_bec3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2794_c7_bec3_cond <= VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_cond;
     n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue;
     n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output := n8_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2802_c7_7ea3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;

     -- t8_MUX[uxn_opcodes_h_l2787_c7_fc94] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond <= VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond;
     t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue;
     t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output := t8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue := VAR_MUX_uxn_opcodes_h_l2800_c32_c91b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2808_c7_47c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2797_c7_3ddc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_bec3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2797_c7_3ddc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2802_c7_7ea3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2797_c7_3ddc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;

     -- t8_MUX[uxn_opcodes_h_l2782_c2_c263] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2782_c2_c263_cond <= VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_cond;
     t8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue;
     t8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output := t8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_7ea3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2790_c7_b50c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_cond;
     n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue;
     n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output := n8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_7ea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2797_c7_3ddc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_bec3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2794_c7_bec3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2794_c7_bec3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2797_c7_3ddc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2790_c7_b50c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2787_c7_fc94] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond <= VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_cond;
     n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue;
     n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output := n8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_3ddc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;
     -- n8_MUX[uxn_opcodes_h_l2782_c2_c263] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2782_c2_c263_cond <= VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_cond;
     n8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue;
     n8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output := n8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2790_c7_b50c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2790_c7_b50c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2790_c7_b50c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_bec3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2787_c7_fc94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_bec3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_bec3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2787_c7_fc94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2787_c7_fc94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2790_c7_b50c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2782_c2_c263] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2790_c7_b50c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2787_c7_fc94] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output := result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2790_c7_b50c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2782_c2_c263] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2782_c2_c263] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_return_output := result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2782_c2_c263] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2787_c7_fc94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2787_c7_fc94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2787_c7_fc94_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2782_c2_c263] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2782_c2_c263] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2778_l2817_DUPLICATE_51bf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2778_l2817_DUPLICATE_51bf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2782_c2_c263_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2782_c2_c263_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2778_l2817_DUPLICATE_51bf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2778_l2817_DUPLICATE_51bf_return_output;
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
