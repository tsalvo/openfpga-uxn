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
-- Submodules: 172
entity rot2_0CLK_37f20a85 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_37f20a85;
architecture arch of rot2_0CLK_37f20a85 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2944_c6_bc10]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_68ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c2_ba7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2945_c3_479f[uxn_opcodes_h_l2945_c3_479f]
signal printf_uxn_opcodes_h_l2945_c3_479f_uxn_opcodes_h_l2945_c3_479f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_8909]
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2949_c7_9263]
signal t16_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2949_c7_9263]
signal l16_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2949_c7_9263]
signal n16_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2949_c7_9263]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2949_c7_9263]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2949_c7_9263]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2949_c7_9263]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2949_c7_9263]
signal result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2949_c7_9263]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_e02b]
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2952_c7_2348]
signal t16_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2952_c7_2348]
signal l16_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2952_c7_2348]
signal n16_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2952_c7_2348]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2952_c7_2348]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2952_c7_2348]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2952_c7_2348]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2952_c7_2348]
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2952_c7_2348]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_e244]
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2957_c7_7dbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_da41]
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal t16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal l16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal n16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2960_c7_be1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2961_c3_6793]
signal BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2964_c11_e476]
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2964_c7_34f3]
signal l16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2964_c7_34f3]
signal n16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2964_c7_34f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2964_c7_34f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2964_c7_34f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2964_c7_34f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2964_c7_34f3]
signal result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2964_c7_34f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2967_c11_0bbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2967_c7_55b2]
signal l16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2967_c7_55b2]
signal n16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2967_c7_55b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2967_c7_55b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2967_c7_55b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2967_c7_55b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2967_c7_55b2]
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2967_c7_55b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2972_c11_e86c]
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2972_c7_46d2]
signal l16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2972_c7_46d2]
signal n16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2972_c7_46d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2972_c7_46d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2972_c7_46d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2972_c7_46d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2972_c7_46d2]
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2972_c7_46d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2975_c11_b7ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2975_c7_f358]
signal l16_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2975_c7_f358]
signal n16_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2975_c7_f358]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2975_c7_f358]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2975_c7_f358]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2975_c7_f358]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2975_c7_f358]
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2975_c7_f358]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2976_c3_9492]
signal BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2979_c11_ebe4]
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2979_c7_e267]
signal l16_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2979_c7_e267]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2979_c7_e267]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2979_c7_e267]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2979_c7_e267]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2979_c7_e267]
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2979_c7_e267]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2982_c11_ea30]
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2982_c7_294f]
signal l16_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2982_c7_294f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2982_c7_294f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2982_c7_294f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2982_c7_294f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2982_c7_294f]
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2982_c7_294f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2987_c11_a29c]
signal BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2987_c7_5b91]
signal l16_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2987_c7_5b91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2987_c7_5b91]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2987_c7_5b91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2987_c7_5b91]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2987_c7_5b91]
signal result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2987_c7_5b91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2990_c11_223c]
signal BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2990_c7_97c0]
signal l16_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2990_c7_97c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2990_c7_97c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2990_c7_97c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2990_c7_97c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2990_c7_97c0]
signal result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2990_c7_97c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2991_c3_15cf]
signal BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2993_c32_999c]
signal BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2993_c32_3599]
signal BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2993_c32_9187]
signal MUX_uxn_opcodes_h_l2993_c32_9187_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2993_c32_9187_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2993_c32_9187_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2993_c32_9187_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2995_c11_94e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2995_c7_68d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2995_c7_68d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2995_c7_68d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2995_c7_68d4]
signal result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2995_c7_68d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3001_c11_542b]
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3001_c7_f6e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3001_c7_f6e8]
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3001_c7_f6e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3001_c7_f6e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3003_c34_286b]
signal CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3005_c11_4f8e]
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3005_c7_f609]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3005_c7_f609]
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3005_c7_f609]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3005_c7_f609]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3009_c11_23b2]
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3009_c7_a45b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3009_c7_a45b]
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3009_c7_a45b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3009_c7_a45b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3011_c34_4acb]
signal CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_4a0f]
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_c6ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3013_c7_c6ac]
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_c6ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_c6ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3017_c11_415e]
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3017_c7_ac2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3017_c7_ac2f]
signal result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3017_c7_ac2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3017_c7_ac2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3019_c34_4e93]
signal CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3021_c11_561f]
signal BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3021_c7_1525]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3021_c7_1525]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10
BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_return_output);

-- t16_MUX_uxn_opcodes_h_l2944_c2_ba7e
t16_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- l16_MUX_uxn_opcodes_h_l2944_c2_ba7e
l16_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- n16_MUX_uxn_opcodes_h_l2944_c2_ba7e
n16_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

-- printf_uxn_opcodes_h_l2945_c3_479f_uxn_opcodes_h_l2945_c3_479f
printf_uxn_opcodes_h_l2945_c3_479f_uxn_opcodes_h_l2945_c3_479f : entity work.printf_uxn_opcodes_h_l2945_c3_479f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2945_c3_479f_uxn_opcodes_h_l2945_c3_479f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_left,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_right,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output);

-- t16_MUX_uxn_opcodes_h_l2949_c7_9263
t16_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
t16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
t16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
t16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- l16_MUX_uxn_opcodes_h_l2949_c7_9263
l16_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
l16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
l16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
l16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- n16_MUX_uxn_opcodes_h_l2949_c7_9263
n16_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
n16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
n16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
n16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_left,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_right,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output);

-- t16_MUX_uxn_opcodes_h_l2952_c7_2348
t16_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
t16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
t16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
t16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- l16_MUX_uxn_opcodes_h_l2952_c7_2348
l16_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
l16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
l16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
l16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- n16_MUX_uxn_opcodes_h_l2952_c7_2348
n16_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
n16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
n16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
n16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_left,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_right,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output);

-- t16_MUX_uxn_opcodes_h_l2957_c7_7dbb
t16_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- l16_MUX_uxn_opcodes_h_l2957_c7_7dbb
l16_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- n16_MUX_uxn_opcodes_h_l2957_c7_7dbb
n16_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_left,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_right,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output);

-- t16_MUX_uxn_opcodes_h_l2960_c7_be1c
t16_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
t16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- l16_MUX_uxn_opcodes_h_l2960_c7_be1c
l16_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
l16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- n16_MUX_uxn_opcodes_h_l2960_c7_be1c
n16_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
n16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793
BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_left,
BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_right,
BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_left,
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_right,
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output);

-- l16_MUX_uxn_opcodes_h_l2964_c7_34f3
l16_MUX_uxn_opcodes_h_l2964_c7_34f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond,
l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue,
l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse,
l16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output);

-- n16_MUX_uxn_opcodes_h_l2964_c7_34f3
n16_MUX_uxn_opcodes_h_l2964_c7_34f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond,
n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue,
n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse,
n16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output);

-- l16_MUX_uxn_opcodes_h_l2967_c7_55b2
l16_MUX_uxn_opcodes_h_l2967_c7_55b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond,
l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue,
l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse,
l16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output);

-- n16_MUX_uxn_opcodes_h_l2967_c7_55b2
n16_MUX_uxn_opcodes_h_l2967_c7_55b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond,
n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue,
n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse,
n16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_left,
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_right,
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output);

-- l16_MUX_uxn_opcodes_h_l2972_c7_46d2
l16_MUX_uxn_opcodes_h_l2972_c7_46d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond,
l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue,
l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse,
l16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output);

-- n16_MUX_uxn_opcodes_h_l2972_c7_46d2
n16_MUX_uxn_opcodes_h_l2972_c7_46d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond,
n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue,
n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse,
n16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output);

-- l16_MUX_uxn_opcodes_h_l2975_c7_f358
l16_MUX_uxn_opcodes_h_l2975_c7_f358 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2975_c7_f358_cond,
l16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue,
l16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse,
l16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output);

-- n16_MUX_uxn_opcodes_h_l2975_c7_f358
n16_MUX_uxn_opcodes_h_l2975_c7_f358 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2975_c7_f358_cond,
n16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue,
n16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse,
n16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_cond,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492
BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_left,
BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_right,
BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_left,
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_right,
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output);

-- l16_MUX_uxn_opcodes_h_l2979_c7_e267
l16_MUX_uxn_opcodes_h_l2979_c7_e267 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2979_c7_e267_cond,
l16_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue,
l16_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse,
l16_MUX_uxn_opcodes_h_l2979_c7_e267_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_cond,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_left,
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_right,
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output);

-- l16_MUX_uxn_opcodes_h_l2982_c7_294f
l16_MUX_uxn_opcodes_h_l2982_c7_294f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2982_c7_294f_cond,
l16_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue,
l16_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse,
l16_MUX_uxn_opcodes_h_l2982_c7_294f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c
BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_left,
BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_right,
BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output);

-- l16_MUX_uxn_opcodes_h_l2987_c7_5b91
l16_MUX_uxn_opcodes_h_l2987_c7_5b91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2987_c7_5b91_cond,
l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue,
l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse,
l16_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_cond,
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c
BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_left,
BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_right,
BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output);

-- l16_MUX_uxn_opcodes_h_l2990_c7_97c0
l16_MUX_uxn_opcodes_h_l2990_c7_97c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2990_c7_97c0_cond,
l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue,
l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse,
l16_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf
BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_left,
BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_right,
BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c
BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_left,
BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_right,
BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599
BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_left,
BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_right,
BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_return_output);

-- MUX_uxn_opcodes_h_l2993_c32_9187
MUX_uxn_opcodes_h_l2993_c32_9187 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2993_c32_9187_cond,
MUX_uxn_opcodes_h_l2993_c32_9187_iftrue,
MUX_uxn_opcodes_h_l2993_c32_9187_iffalse,
MUX_uxn_opcodes_h_l2993_c32_9187_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_left,
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_right,
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3003_c34_286b
CONST_SR_8_uxn_opcodes_h_l3003_c34_286b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_x,
CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_left,
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_right,
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_cond,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_left,
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_right,
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_cond,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb
CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_x,
CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_left,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_right,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_left,
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_right,
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93
CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_x,
CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f
BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_left,
BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_right,
BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7
CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_return_output,
 t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output,
 t16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 l16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 n16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output,
 t16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 l16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 n16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output,
 t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output,
 t16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 l16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 n16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output,
 l16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output,
 n16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output,
 l16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output,
 n16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output,
 l16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output,
 n16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output,
 l16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output,
 n16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output,
 l16_MUX_uxn_opcodes_h_l2979_c7_e267_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output,
 l16_MUX_uxn_opcodes_h_l2982_c7_294f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output,
 l16_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output,
 l16_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_return_output,
 MUX_uxn_opcodes_h_l2993_c32_9187_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output,
 CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output,
 CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output,
 CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_87cd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2945_c3_479f_uxn_opcodes_h_l2945_c3_479f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_64f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2955_c3_217b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_2ac6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2962_c3_aade : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_42a9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2970_c3_98ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_79a9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_24ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_028a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2985_c3_33e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_8a20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2993_c32_9187_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2993_c32_9187_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2993_c32_9187_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2993_c32_9187_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_7d0a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_30e8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_1dbc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_ac38_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_9451 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_5a61_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_b79c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_f75f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_5206 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_dfb1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_1236 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3019_c24_fccd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2983_l2991_l2961_l2953_l2976_l2968_DUPLICATE_47f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_9c04_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3026_l2940_DUPLICATE_82cd_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2955_c3_217b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2955_c3_217b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_right := to_unsigned(17, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_79a9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_79a9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_b79c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_b79c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_8a20 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_8a20;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_right := to_unsigned(16, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_7d0a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_7d0a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_1236 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_1236;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l2993_c32_9187_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_24ce := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_24ce;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_64f7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_64f7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_right := to_unsigned(18, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_87cd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_87cd;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_right := to_unsigned(12, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_right := to_unsigned(14, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_42a9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_42a9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_5206 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_5206;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_1dbc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_1dbc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2962_c3_aade := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2962_c3_aade;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_9451 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_9451;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2993_c32_9187_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_028a := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_028a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2985_c3_33e2 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2985_c3_33e2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_2ac6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_2ac6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2970_c3_98ba := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2970_c3_98ba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l3021_c11_561f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2995_c11_94e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_e02b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3015_c24_dfb1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_dfb1_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2967_c11_0bbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output := result.stack_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3007_c24_5a61] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_5a61_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8[uxn_opcodes_h_l3003_c34_286b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_return_output := CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_4a0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3005_c11_4f8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2982_c11_ea30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3001_c11_542b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_e244] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_left;
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output := BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c6_bc10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2993_c32_999c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_left;
     BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_return_output := BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2987_c11_a29c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3017_c11_415e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2990_c11_223c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_9c04 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_9c04_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2979_c11_ebe4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3011_c34_4acb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_return_output := CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_8909] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_left;
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output := BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2999_c24_30e8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_30e8_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2983_l2991_l2961_l2953_l2976_l2968_DUPLICATE_47f7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2983_l2991_l2961_l2953_l2976_l2968_DUPLICATE_47f7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2972_c11_e86c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3009_c11_23b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l3019_c34_4e93] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_return_output := CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_da41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_left;
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output := BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2964_c11_e476] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_left;
     BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output := BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2975_c11_b7ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_999c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_bc10_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_8909_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_e02b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_e244_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_da41_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_e476_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_0bbd_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_e86c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_b7ca_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebe4_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_ea30_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_a29c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_223c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_94e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_542b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_4f8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_23b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_4a0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_415e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_561f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2983_l2991_l2961_l2953_l2976_l2968_DUPLICATE_47f7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2983_l2991_l2961_l2953_l2976_l2968_DUPLICATE_47f7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2983_l2991_l2961_l2953_l2976_l2968_DUPLICATE_47f7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2983_l2991_l2961_l2953_l2976_l2968_DUPLICATE_47f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_30e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_5a61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_dfb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_d835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3001_l2995_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_DUPLICATE_e145_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2949_l2972_l2995_l2944_l2967_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_1b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3001_l2990_l2987_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_DUPLICATE_bfa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_9c04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_9c04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_l2960_l2982_l2957_l2979_l2952_l2975_DUPLICATE_8737_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l3019_c24_fccd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3019_c24_fccd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_4e93_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2991_c3_15cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_left;
     BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_return_output := BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2961_c3_6793] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_left;
     BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_return_output := BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3017_c7_ac2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3003_c24_ac38] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_ac38_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_286b_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2995_c7_68d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3021_c7_1525] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2976_c3_9492] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_left;
     BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_return_output := BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2993_c32_3599] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_left;
     BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_return_output := BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_68ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3011_c24_f75f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_f75f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_4acb_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3021_c7_1525] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2993_c32_9187_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_3599_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_6793_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_9492_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_15cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_ac38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_f75f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3019_c24_fccd_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2954_l2969_l2984_DUPLICATE_7fc7_return_output;
     VAR_printf_uxn_opcodes_h_l2945_c3_479f_uxn_opcodes_h_l2945_c3_479f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_68ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_1525_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_1525_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output;
     -- MUX[uxn_opcodes_h_l2993_c32_9187] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2993_c32_9187_cond <= VAR_MUX_uxn_opcodes_h_l2993_c32_9187_cond;
     MUX_uxn_opcodes_h_l2993_c32_9187_iftrue <= VAR_MUX_uxn_opcodes_h_l2993_c32_9187_iftrue;
     MUX_uxn_opcodes_h_l2993_c32_9187_iffalse <= VAR_MUX_uxn_opcodes_h_l2993_c32_9187_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2993_c32_9187_return_output := MUX_uxn_opcodes_h_l2993_c32_9187_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_c6ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3017_c7_ac2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2990_c7_97c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := t16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3017_c7_ac2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output;

     -- printf_uxn_opcodes_h_l2945_c3_479f[uxn_opcodes_h_l2945_c3_479f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2945_c3_479f_uxn_opcodes_h_l2945_c3_479f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2945_c3_479f_uxn_opcodes_h_l2945_c3_479f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l3017_c7_ac2f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2975_c7_f358] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2975_c7_f358_cond <= VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_cond;
     n16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue;
     n16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output := n16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;

     -- l16_MUX[uxn_opcodes_h_l2990_c7_97c0] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2990_c7_97c0_cond <= VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_cond;
     l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue;
     l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output := l16_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue := VAR_MUX_uxn_opcodes_h_l2993_c32_9187_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_ac2f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     -- t16_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3013_c7_c6ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_c6ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output;

     -- l16_MUX[uxn_opcodes_h_l2987_c7_5b91] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2987_c7_5b91_cond <= VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_cond;
     l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue;
     l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output := l16_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2987_c7_5b91] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2990_c7_97c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3009_c7_a45b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2972_c7_46d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond;
     n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue;
     n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output := n16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_c6ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_c6ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2982_c7_294f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3005_c7_f609] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3009_c7_a45b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2967_c7_55b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond;
     n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue;
     n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output := n16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2982_c7_294f] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2982_c7_294f_cond <= VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_cond;
     l16_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue;
     l16_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_return_output := l16_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3009_c7_a45b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     t16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     t16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := t16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3009_c7_a45b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output := result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2987_c7_5b91] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_f609_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_a45b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     -- n16_MUX[uxn_opcodes_h_l2964_c7_34f3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond;
     n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue;
     n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output := n16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     t16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     t16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := t16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3005_c7_f609] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_return_output := result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3005_c7_f609] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2979_c7_e267] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3005_c7_f609] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_return_output;

     -- l16_MUX[uxn_opcodes_h_l2979_c7_e267] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2979_c7_e267_cond <= VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_cond;
     l16_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue;
     l16_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_return_output := l16_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2982_c7_294f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3001_c7_f6e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_f609_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_f609_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_f609_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2975_c7_f358] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3001_c7_f6e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2995_c7_68d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := n16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3001_c7_f6e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2979_c7_e267] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3001_c7_f6e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2975_c7_f358] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2975_c7_f358_cond <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_cond;
     l16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue;
     l16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output := l16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_f6e8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2972_c7_46d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- l16_MUX[uxn_opcodes_h_l2972_c7_46d2] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond <= VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_cond;
     l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue;
     l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output := l16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2990_c7_97c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2995_c7_68d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2995_c7_68d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2995_c7_68d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2975_c7_f358] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_68d4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2990_c7_97c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2990_c7_97c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;

     -- l16_MUX[uxn_opcodes_h_l2967_c7_55b2] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond <= VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_cond;
     l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue;
     l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output := l16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     n16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     n16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := n16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2987_c7_5b91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2967_c7_55b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2972_c7_46d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2990_c7_97c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_97c0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2987_c7_5b91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;

     -- n16_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     n16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     n16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := n16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2967_c7_55b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2964_c7_34f3] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond <= VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_cond;
     l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue;
     l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output := l16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2982_c7_294f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2964_c7_34f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2987_c7_5b91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2987_c7_5b91] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output := result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_5b91_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2982_c7_294f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2979_c7_e267] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;

     -- l16_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := l16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2982_c7_294f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2982_c7_294f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2964_c7_34f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_294f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2979_c7_e267] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2979_c7_e267] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;

     -- l16_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2979_c7_e267] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_return_output := result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2975_c7_f358] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_e267_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2972_c7_46d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2975_c7_f358] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_return_output := result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2975_c7_f358] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;

     -- l16_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     l16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     l16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := l16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2975_c7_f358] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_f358_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2972_c7_46d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     l16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     l16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := l16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2967_c7_55b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2972_c7_46d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2972_c7_46d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_46d2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- l16_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2967_c7_55b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2967_c7_55b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2967_c7_55b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2964_c7_34f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_55b2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2964_c7_34f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2964_c7_34f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2964_c7_34f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_34f3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2960_c7_be1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_be1c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2957_c7_7dbb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_7dbb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2952_c7_2348] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_return_output := result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_2348_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2949_c7_9263] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_9263_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2944_c2_ba7e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3026_l2940_DUPLICATE_82cd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3026_l2940_DUPLICATE_82cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_ba7e_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3026_l2940_DUPLICATE_82cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3026_l2940_DUPLICATE_82cd_return_output;
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
