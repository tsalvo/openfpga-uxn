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
-- BIN_OP_EQ[uxn_opcodes_h_l2940_c6_84d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_a77e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2940_c2_c771]
signal l16_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2940_c2_c771]
signal n16_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2940_c2_c771]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2940_c2_c771]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2940_c2_c771]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2940_c2_c771]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2940_c2_c771]
signal result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2940_c2_c771]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2940_c2_c771]
signal t16_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2941_c3_8c25[uxn_opcodes_h_l2941_c3_8c25]
signal printf_uxn_opcodes_h_l2941_c3_8c25_uxn_opcodes_h_l2941_c3_8c25_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_8545]
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal l16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal n16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2945_c7_d77d]
signal t16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_2d75]
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal l16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal n16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2948_c7_26c6]
signal t16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_a7be]
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal l16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal n16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2953_c7_7f46]
signal t16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_7e5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2956_c7_d248]
signal l16_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2956_c7_d248]
signal n16_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2956_c7_d248]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2956_c7_d248]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2956_c7_d248]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2956_c7_d248]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2956_c7_d248]
signal result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2956_c7_d248]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2956_c7_d248]
signal t16_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2957_c3_8eda]
signal BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_1dac]
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2960_c7_1301]
signal l16_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2960_c7_1301]
signal n16_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2960_c7_1301]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2960_c7_1301]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2960_c7_1301]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2960_c7_1301]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2960_c7_1301]
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2960_c7_1301]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2963_c11_bfc8]
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2963_c7_2e62]
signal l16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2963_c7_2e62]
signal n16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2963_c7_2e62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2963_c7_2e62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2963_c7_2e62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2963_c7_2e62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2963_c7_2e62]
signal result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2963_c7_2e62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2968_c11_abe6]
signal BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2968_c7_aa48]
signal l16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2968_c7_aa48]
signal n16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2968_c7_aa48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2968_c7_aa48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2968_c7_aa48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2968_c7_aa48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2968_c7_aa48]
signal result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2968_c7_aa48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2971_c11_e1bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2971_c7_4a58]
signal l16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2971_c7_4a58]
signal n16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2971_c7_4a58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2971_c7_4a58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2971_c7_4a58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2971_c7_4a58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2971_c7_4a58]
signal result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2971_c7_4a58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2972_c3_6901]
signal BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2975_c11_be16]
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2975_c7_60bf]
signal l16_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2975_c7_60bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2975_c7_60bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2975_c7_60bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2975_c7_60bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2975_c7_60bf]
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2975_c7_60bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2978_c11_3886]
signal BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2978_c7_eb97]
signal l16_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2978_c7_eb97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2978_c7_eb97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2978_c7_eb97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2978_c7_eb97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2978_c7_eb97]
signal result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2978_c7_eb97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2983_c11_5d25]
signal BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2983_c7_98ee]
signal l16_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2983_c7_98ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2983_c7_98ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2983_c7_98ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2983_c7_98ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2983_c7_98ee]
signal result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2983_c7_98ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2986_c11_f597]
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2986_c7_5755]
signal l16_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c7_5755]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c7_5755]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2986_c7_5755]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c7_5755]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2986_c7_5755]
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c7_5755]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2987_c3_a604]
signal BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2989_c32_a97f]
signal BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2989_c32_c4b3]
signal BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2989_c32_f469]
signal MUX_uxn_opcodes_h_l2989_c32_f469_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2989_c32_f469_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2989_c32_f469_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2989_c32_f469_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_bef8]
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_2162]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_2162]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_2162]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2991_c7_2162]
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c7_2162]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2997_c11_b396]
signal BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2997_c7_0039]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2997_c7_0039]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2997_c7_0039]
signal result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2997_c7_0039]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2999_c34_88df]
signal CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3001_c11_7656]
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3001_c7_d46f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3001_c7_d46f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3001_c7_d46f]
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3001_c7_d46f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3005_c11_ea1b]
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3005_c7_b7b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3005_c7_b7b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3005_c7_b7b2]
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3005_c7_b7b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3007_c34_6fd6]
signal CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3009_c11_418d]
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3009_c7_7789]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3009_c7_7789]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3009_c7_7789]
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3009_c7_7789]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_114a]
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_63ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_63ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3013_c7_63ef]
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_63ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3015_c34_18c1]
signal CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3017_c11_dcd4]
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3017_c7_d0f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3017_c7_d0f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9
BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_return_output);

-- l16_MUX_uxn_opcodes_h_l2940_c2_c771
l16_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
l16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
l16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
l16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- n16_MUX_uxn_opcodes_h_l2940_c2_c771
n16_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
n16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
n16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
n16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771
result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771
result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- t16_MUX_uxn_opcodes_h_l2940_c2_c771
t16_MUX_uxn_opcodes_h_l2940_c2_c771 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2940_c2_c771_cond,
t16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue,
t16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse,
t16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

-- printf_uxn_opcodes_h_l2941_c3_8c25_uxn_opcodes_h_l2941_c3_8c25
printf_uxn_opcodes_h_l2941_c3_8c25_uxn_opcodes_h_l2941_c3_8c25 : entity work.printf_uxn_opcodes_h_l2941_c3_8c25_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2941_c3_8c25_uxn_opcodes_h_l2941_c3_8c25_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_left,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_right,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output);

-- l16_MUX_uxn_opcodes_h_l2945_c7_d77d
l16_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
l16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- n16_MUX_uxn_opcodes_h_l2945_c7_d77d
n16_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
n16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d
result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d
result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d
result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d
result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- t16_MUX_uxn_opcodes_h_l2945_c7_d77d
t16_MUX_uxn_opcodes_h_l2945_c7_d77d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond,
t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue,
t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse,
t16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_left,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_right,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output);

-- l16_MUX_uxn_opcodes_h_l2948_c7_26c6
l16_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
l16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- n16_MUX_uxn_opcodes_h_l2948_c7_26c6
n16_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
n16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6
result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6
result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6
result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6
result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- t16_MUX_uxn_opcodes_h_l2948_c7_26c6
t16_MUX_uxn_opcodes_h_l2948_c7_26c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond,
t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue,
t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse,
t16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_left,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_right,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output);

-- l16_MUX_uxn_opcodes_h_l2953_c7_7f46
l16_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
l16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- n16_MUX_uxn_opcodes_h_l2953_c7_7f46
n16_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
n16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46
result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46
result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46
result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46
result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46
result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- t16_MUX_uxn_opcodes_h_l2953_c7_7f46
t16_MUX_uxn_opcodes_h_l2953_c7_7f46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond,
t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue,
t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse,
t16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output);

-- l16_MUX_uxn_opcodes_h_l2956_c7_d248
l16_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
l16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
l16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
l16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- n16_MUX_uxn_opcodes_h_l2956_c7_d248
n16_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
n16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
n16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
n16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248
result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248
result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248
result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248
result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248
result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- t16_MUX_uxn_opcodes_h_l2956_c7_d248
t16_MUX_uxn_opcodes_h_l2956_c7_d248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2956_c7_d248_cond,
t16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue,
t16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse,
t16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda
BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_left,
BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_right,
BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_left,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_right,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output);

-- l16_MUX_uxn_opcodes_h_l2960_c7_1301
l16_MUX_uxn_opcodes_h_l2960_c7_1301 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2960_c7_1301_cond,
l16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue,
l16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse,
l16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output);

-- n16_MUX_uxn_opcodes_h_l2960_c7_1301
n16_MUX_uxn_opcodes_h_l2960_c7_1301 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2960_c7_1301_cond,
n16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue,
n16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse,
n16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_cond,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_left,
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_right,
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output);

-- l16_MUX_uxn_opcodes_h_l2963_c7_2e62
l16_MUX_uxn_opcodes_h_l2963_c7_2e62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond,
l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue,
l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse,
l16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output);

-- n16_MUX_uxn_opcodes_h_l2963_c7_2e62
n16_MUX_uxn_opcodes_h_l2963_c7_2e62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond,
n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue,
n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse,
n16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62
result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62
result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62
result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62
result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_cond,
result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62
result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6
BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_left,
BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_right,
BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output);

-- l16_MUX_uxn_opcodes_h_l2968_c7_aa48
l16_MUX_uxn_opcodes_h_l2968_c7_aa48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond,
l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue,
l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse,
l16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output);

-- n16_MUX_uxn_opcodes_h_l2968_c7_aa48
n16_MUX_uxn_opcodes_h_l2968_c7_aa48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond,
n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue,
n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse,
n16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_cond,
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd
BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output);

-- l16_MUX_uxn_opcodes_h_l2971_c7_4a58
l16_MUX_uxn_opcodes_h_l2971_c7_4a58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond,
l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue,
l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse,
l16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output);

-- n16_MUX_uxn_opcodes_h_l2971_c7_4a58
n16_MUX_uxn_opcodes_h_l2971_c7_4a58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond,
n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue,
n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse,
n16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_cond,
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901
BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_left,
BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_right,
BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_left,
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_right,
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output);

-- l16_MUX_uxn_opcodes_h_l2975_c7_60bf
l16_MUX_uxn_opcodes_h_l2975_c7_60bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2975_c7_60bf_cond,
l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue,
l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse,
l16_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886
BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_left,
BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_right,
BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output);

-- l16_MUX_uxn_opcodes_h_l2978_c7_eb97
l16_MUX_uxn_opcodes_h_l2978_c7_eb97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2978_c7_eb97_cond,
l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue,
l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse,
l16_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97
result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97
result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97
result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97
result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_cond,
result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97
result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25
BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_left,
BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_right,
BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output);

-- l16_MUX_uxn_opcodes_h_l2983_c7_98ee
l16_MUX_uxn_opcodes_h_l2983_c7_98ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2983_c7_98ee_cond,
l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue,
l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse,
l16_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_cond,
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_left,
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_right,
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output);

-- l16_MUX_uxn_opcodes_h_l2986_c7_5755
l16_MUX_uxn_opcodes_h_l2986_c7_5755 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2986_c7_5755_cond,
l16_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue,
l16_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse,
l16_MUX_uxn_opcodes_h_l2986_c7_5755_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_cond,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604
BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_left,
BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_right,
BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f
BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_left,
BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_right,
BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3
BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_left,
BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_right,
BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_return_output);

-- MUX_uxn_opcodes_h_l2989_c32_f469
MUX_uxn_opcodes_h_l2989_c32_f469 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2989_c32_f469_cond,
MUX_uxn_opcodes_h_l2989_c32_f469_iftrue,
MUX_uxn_opcodes_h_l2989_c32_f469_iffalse,
MUX_uxn_opcodes_h_l2989_c32_f469_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_left,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_right,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_cond,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396
BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_left,
BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_right,
BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039
result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_cond,
result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2999_c34_88df
CONST_SR_8_uxn_opcodes_h_l2999_c34_88df : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_x,
CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_left,
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_right,
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_left,
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_right,
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6
CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_x,
CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_left,
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_right,
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_cond,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_left,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_right,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_cond,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1
CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_x,
CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_left,
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_right,
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148
CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_return_output,
 l16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 n16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 t16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output,
 l16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 n16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 t16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output,
 l16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 n16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 t16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output,
 l16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 n16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 t16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output,
 l16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 n16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 t16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output,
 l16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output,
 n16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output,
 l16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output,
 n16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output,
 l16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output,
 n16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output,
 l16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output,
 n16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output,
 l16_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output,
 l16_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output,
 l16_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output,
 l16_MUX_uxn_opcodes_h_l2986_c7_5755_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_return_output,
 MUX_uxn_opcodes_h_l2989_c32_f469_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_return_output,
 CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output,
 CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output,
 CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iffalse : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2942_c3_aeac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2941_c3_8c25_uxn_opcodes_h_l2941_c3_8c25_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_2e39 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2951_c3_5965 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2954_c3_9fa6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_5c6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2961_c3_8961 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2966_c3_c0a7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_dacc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_624a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2976_c3_b0fe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2981_c3_8b26 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2984_c3_fe1c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2989_c32_f469_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2989_c32_f469_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2989_c32_f469_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2989_c32_f469_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2994_c3_3fb4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2995_c24_b0c3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_b70b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_4a72_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_6b67 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_4823_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_3833 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_3323_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_9b5e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_10fb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_af85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_4628_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2949_l2957_l2964_l2987_l2979_l2972_DUPLICATE_c7d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3013_l2986_DUPLICATE_6884_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3022_l2936_DUPLICATE_e1e1_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2954_c3_9fa6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2954_c3_9fa6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2984_c3_fe1c := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2984_c3_fe1c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_right := to_unsigned(13, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_right := to_unsigned(12, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2942_c3_aeac := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2942_c3_aeac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_624a := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_624a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_af85 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_af85;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_right := to_unsigned(18, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_5c6d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_5c6d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2951_c3_5965 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2951_c3_5965;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_right := to_unsigned(14, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2994_c3_3fb4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2994_c3_3fb4;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_dacc := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_dacc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_2e39 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_2e39;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2966_c3_c0a7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2966_c3_c0a7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2961_c3_8961 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2961_c3_8961;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_b70b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_b70b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_9b5e := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_9b5e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2976_c3_b0fe := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2976_c3_b0fe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2981_c3_8b26 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2981_c3_8b26;
     VAR_MUX_uxn_opcodes_h_l2989_c32_f469_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_3833 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_3833;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_right := to_unsigned(19, 5);
     VAR_MUX_uxn_opcodes_h_l2989_c32_f469_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_6b67 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_6b67;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2995_c24_b0c3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2995_c24_b0c3_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2963_c11_bfc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3009_c11_418d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3015_c34_18c1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_return_output := CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3003_c24_4823] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_4823_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3005_c11_ea1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2997_c11_b396] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_left;
     BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output := BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3013_l2986_DUPLICATE_6884 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3013_l2986_DUPLICATE_6884_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_1dac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_bef8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2978_c11_3886] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_left;
     BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output := BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3017_c11_dcd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2968_c11_abe6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_2d75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2986_c11_f597] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_left;
     BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output := BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3011_c24_10fb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_10fb_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2975_c11_be16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_left;
     BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output := BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2989_c32_a97f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_left;
     BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_return_output := BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2999_c34_88df] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_return_output := CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3001_c11_7656] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_left;
     BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output := BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l3007_c34_6fd6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_return_output := CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c6_84d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2983_c11_5d25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_left;
     BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output := BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_114a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_a7be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_left;
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output := BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2971_c11_e1bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2949_l2957_l2964_l2987_l2979_l2972_DUPLICATE_c7d7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2949_l2957_l2964_l2987_l2979_l2972_DUPLICATE_c7d7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_8545] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_left;
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output := BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_7e5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2989_c32_a97f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c6_84d9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_8545_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_2d75_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_a7be_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_7e5c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_1dac_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_bfc8_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_abe6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_e1bd_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_be16_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2978_c11_3886_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_5d25_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_f597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_bef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_b396_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_7656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_ea1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_418d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_114a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_dcd4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2949_l2957_l2964_l2987_l2979_l2972_DUPLICATE_c7d7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2949_l2957_l2964_l2987_l2979_l2972_DUPLICATE_c7d7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2949_l2957_l2964_l2987_l2979_l2972_DUPLICATE_c7d7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2949_l2957_l2964_l2987_l2979_l2972_DUPLICATE_c7d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2995_c24_b0c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_4823_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_10fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l2960_l2983_l2956_DUPLICATE_e808_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2953_l2948_l2945_l3017_l3013_l3009_l3005_l3001_l2997_l2991_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_b9d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2991_l2940_l2963_l2960_l2983_l2956_DUPLICATE_6480_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2953_l2948_l2945_l2940_l3017_l3013_l3009_l3005_l3001_l2997_l2986_l2983_l2978_l2975_l2971_l2968_l2963_l2960_l2956_DUPLICATE_819e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3013_l2986_DUPLICATE_6884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3013_l2986_DUPLICATE_6884_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2978_l2953_l2975_l2948_l2971_l2945_l2968_l2940_l2963_l2986_l3013_l2960_l2983_l2956_DUPLICATE_0598_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2987_c3_a604] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_left;
     BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_return_output := BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3015_c24_4628] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_4628_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3015_c34_18c1_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3007_c24_3323] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_3323_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3007_c34_6fd6_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_63ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2972_c3_6901] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_left;
     BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_return_output := BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2999_c24_4a72] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_4a72_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2999_c34_88df_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3017_c7_d0f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c7_2162] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2957_c3_8eda] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_left;
     BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_return_output := BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2989_c32_c4b3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_left;
     BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_return_output := BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3017_c7_d0f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_a77e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2989_c32_f469_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2989_c32_c4b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c3_8eda_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2972_c3_6901_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2987_c3_a604_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_4a72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_3323_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_4628_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2950_l2980_l2965_DUPLICATE_9148_return_output;
     VAR_printf_uxn_opcodes_h_l2941_c3_8c25_uxn_opcodes_h_l2941_c3_8c25_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_a77e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_d0f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output;
     -- MUX[uxn_opcodes_h_l2989_c32_f469] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2989_c32_f469_cond <= VAR_MUX_uxn_opcodes_h_l2989_c32_f469_cond;
     MUX_uxn_opcodes_h_l2989_c32_f469_iftrue <= VAR_MUX_uxn_opcodes_h_l2989_c32_f469_iftrue;
     MUX_uxn_opcodes_h_l2989_c32_f469_iffalse <= VAR_MUX_uxn_opcodes_h_l2989_c32_f469_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2989_c32_f469_return_output := MUX_uxn_opcodes_h_l2989_c32_f469_return_output;

     -- l16_MUX[uxn_opcodes_h_l2986_c7_5755] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2986_c7_5755_cond <= VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_cond;
     l16_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue;
     l16_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_return_output := l16_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;

     -- printf_uxn_opcodes_h_l2941_c3_8c25[uxn_opcodes_h_l2941_c3_8c25] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2941_c3_8c25_uxn_opcodes_h_l2941_c3_8c25_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2941_c3_8c25_uxn_opcodes_h_l2941_c3_8c25_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l3013_c7_63ef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output := result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c7_5755] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;

     -- n16_MUX[uxn_opcodes_h_l2971_c7_4a58] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond <= VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond;
     n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue;
     n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output := n16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;

     -- t16_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     t16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     t16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := t16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3009_c7_7789] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_63ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_63ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue := VAR_MUX_uxn_opcodes_h_l2989_c32_f469_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_7789_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_63ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     -- n16_MUX[uxn_opcodes_h_l2968_c7_aa48] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond <= VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond;
     n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue;
     n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output := n16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2986_c7_5755] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3009_c7_7789] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_return_output;

     -- t16_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := t16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2983_c7_98ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3009_c7_7789] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3009_c7_7789] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_return_output := result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3005_c7_b7b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2983_c7_98ee] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2983_c7_98ee_cond <= VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_cond;
     l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue;
     l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output := l16_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_7789_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_7789_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_7789_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3005_c7_b7b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := t16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3005_c7_b7b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2963_c7_2e62] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond <= VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond;
     n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue;
     n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output := n16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2978_c7_eb97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2983_c7_98ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3001_c7_d46f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output;

     -- l16_MUX[uxn_opcodes_h_l2978_c7_eb97] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2978_c7_eb97_cond <= VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_cond;
     l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue;
     l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output := l16_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3005_c7_b7b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_b7b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     -- t16_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := t16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2960_c7_1301] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2960_c7_1301_cond <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_cond;
     n16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue;
     n16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output := n16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2997_c7_0039] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2975_c7_60bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3001_c7_d46f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2978_c7_eb97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3001_c7_d46f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output;

     -- l16_MUX[uxn_opcodes_h_l2975_c7_60bf] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2975_c7_60bf_cond <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_cond;
     l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue;
     l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output := l16_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3001_c7_d46f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_0039_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_d46f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_2162] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2971_c7_4a58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2997_c7_0039] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2997_c7_0039] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_return_output;

     -- t16_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     t16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     t16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := t16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2975_c7_60bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2997_c7_0039] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_return_output := result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_return_output;

     -- l16_MUX[uxn_opcodes_h_l2971_c7_4a58] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond <= VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_cond;
     l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue;
     l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output := l16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;

     -- n16_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     n16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     n16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := n16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_0039_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_0039_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2997_c7_0039_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;
     -- n16_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := n16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2971_c7_4a58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;

     -- l16_MUX[uxn_opcodes_h_l2968_c7_aa48] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond <= VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_cond;
     l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue;
     l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output := l16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_2162] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_2162] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2968_c7_aa48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2991_c7_2162] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_return_output := result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c7_5755] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_2162_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c7_5755] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;

     -- l16_MUX[uxn_opcodes_h_l2963_c7_2e62] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond <= VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_cond;
     l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue;
     l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output := l16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2968_c7_aa48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c7_5755] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2983_c7_98ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2986_c7_5755] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_return_output := result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;

     -- n16_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := n16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2963_c7_2e62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5755_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2963_c7_2e62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2983_c7_98ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := n16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2978_c7_eb97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;

     -- l16_MUX[uxn_opcodes_h_l2960_c7_1301] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2960_c7_1301_cond <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_cond;
     l16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue;
     l16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output := l16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2983_c7_98ee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output := result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2960_c7_1301] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2983_c7_98ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_98ee_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2978_c7_eb97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;

     -- n16_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     n16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     n16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := n16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2978_c7_eb97] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output := result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2960_c7_1301] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2975_c7_60bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2978_c7_eb97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;

     -- l16_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     l16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     l16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := l16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2978_c7_eb97_return_output;
     -- l16_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := l16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2975_c7_60bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2975_c7_60bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2975_c7_60bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2971_c7_4a58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_60bf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2968_c7_aa48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2971_c7_4a58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2971_c7_4a58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2971_c7_4a58] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output := result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- l16_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := l16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_4a58_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2963_c7_2e62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2968_c7_aa48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;

     -- l16_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := l16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2968_c7_aa48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2968_c7_aa48] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output := result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_aa48_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2960_c7_1301] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2963_c7_2e62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2963_c7_2e62] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output := result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- l16_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     l16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     l16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := l16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2963_c7_2e62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2963_c7_2e62_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2960_c7_1301] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_return_output := result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2960_c7_1301] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2960_c7_1301] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_1301_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2956_c7_d248] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2956_c7_d248_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2953_c7_7f46] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output := result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2953_c7_7f46_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2948_c7_26c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2948_c7_26c6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2945_c7_d77d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2945_c7_d77d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2940_c2_c771] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3022_l2936_DUPLICATE_e1e1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3022_l2936_DUPLICATE_e1e1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2940_c2_c771_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2940_c2_c771_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3022_l2936_DUPLICATE_e1e1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l3022_l2936_DUPLICATE_e1e1_return_output;
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
