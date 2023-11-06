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
entity rot_0CLK_97e5913d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_97e5913d;
architecture arch of rot_0CLK_97e5913d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2506_c6_9273]
signal BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2506_c1_90e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal t8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal n8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal l8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2506_c2_6ace]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l2507_c3_06dc[uxn_opcodes_h_l2507_c3_06dc]
signal printf_uxn_opcodes_h_l2507_c3_06dc_uxn_opcodes_h_l2507_c3_06dc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2511_c11_e7b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2511_c7_1931]
signal t8_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2511_c7_1931]
signal n8_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2511_c7_1931]
signal l8_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2511_c7_1931]
signal result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2511_c7_1931]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2511_c7_1931]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2511_c7_1931]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2511_c7_1931]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2511_c7_1931]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2514_c11_9608]
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal t8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal n8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal l8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2514_c7_0cae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_8e9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2518_c7_15f4]
signal n8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2518_c7_15f4]
signal l8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_15f4]
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2518_c7_15f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_15f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_15f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_15f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_15f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_c309]
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2521_c7_1c5f]
signal l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_1c5f]
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2521_c7_1c5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_1c5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_1c5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_1c5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_1c5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2524_c30_7ab3]
signal sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2529_c11_7488]
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2529_c7_cc8f]
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2529_c7_cc8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2529_c7_cc8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2529_c7_cc8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2529_c7_cc8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_d380]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_0432]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_0432]
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_0432]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_0432]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2538_c11_73c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2538_c7_c295]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2538_c7_c295]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273
BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_left,
BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_right,
BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_return_output);

-- t8_MUX_uxn_opcodes_h_l2506_c2_6ace
t8_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
t8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- n8_MUX_uxn_opcodes_h_l2506_c2_6ace
n8_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
n8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- l8_MUX_uxn_opcodes_h_l2506_c2_6ace
l8_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
l8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace
result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace
result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

-- printf_uxn_opcodes_h_l2507_c3_06dc_uxn_opcodes_h_l2507_c3_06dc
printf_uxn_opcodes_h_l2507_c3_06dc_uxn_opcodes_h_l2507_c3_06dc : entity work.printf_uxn_opcodes_h_l2507_c3_06dc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2507_c3_06dc_uxn_opcodes_h_l2507_c3_06dc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output);

-- t8_MUX_uxn_opcodes_h_l2511_c7_1931
t8_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
t8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
t8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
t8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- n8_MUX_uxn_opcodes_h_l2511_c7_1931
n8_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
n8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
n8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
n8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- l8_MUX_uxn_opcodes_h_l2511_c7_1931
l8_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
l8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
l8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
l8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931
result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_left,
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_right,
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output);

-- t8_MUX_uxn_opcodes_h_l2514_c7_0cae
t8_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
t8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- n8_MUX_uxn_opcodes_h_l2514_c7_0cae
n8_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
n8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- l8_MUX_uxn_opcodes_h_l2514_c7_0cae
l8_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
l8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output);

-- n8_MUX_uxn_opcodes_h_l2518_c7_15f4
n8_MUX_uxn_opcodes_h_l2518_c7_15f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond,
n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue,
n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse,
n8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output);

-- l8_MUX_uxn_opcodes_h_l2518_c7_15f4
l8_MUX_uxn_opcodes_h_l2518_c7_15f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond,
l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue,
l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse,
l8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4
result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_left,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_right,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output);

-- l8_MUX_uxn_opcodes_h_l2521_c7_1c5f
l8_MUX_uxn_opcodes_h_l2521_c7_1c5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond,
l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue,
l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse,
l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f
result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3
sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_ins,
sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_x,
sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_y,
sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_left,
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_right,
BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f
result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_cond,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_return_output,
 t8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 n8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 l8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output,
 t8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 n8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 l8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output,
 t8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 n8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 l8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output,
 n8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output,
 l8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output,
 l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_5f89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2507_c3_06dc_uxn_opcodes_h_l2507_c3_06dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_63e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_b2db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2526_c3_5040 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_a730 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_4be4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2518_l2514_l2511_l2506_l2534_DUPLICATE_988d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2506_DUPLICATE_d6eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2518_l2514_l2511_l2506_DUPLICATE_5927_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2518_l2534_DUPLICATE_5afb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2502_l2543_DUPLICATE_a191_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_b2db := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_b2db;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2526_c3_5040 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2526_c3_5040;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_63e0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_63e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_4be4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_4be4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_a730 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_a730;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_5f89 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_5f89;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2518_l2514_l2511_l2506_DUPLICATE_5927 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2518_l2514_l2511_l2506_DUPLICATE_5927_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2506_DUPLICATE_d6eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2506_DUPLICATE_d6eb_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2524_c30_7ab3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_ins;
     sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_x;
     sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_return_output := sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2518_l2534_DUPLICATE_5afb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2518_l2534_DUPLICATE_5afb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2518_l2514_l2511_l2506_l2534_DUPLICATE_988d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2518_l2514_l2511_l2506_l2534_DUPLICATE_988d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_d380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2529_c11_7488] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_left;
     BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output := BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2538_c11_73c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2511_c11_e7b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_c309] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_left;
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output := BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_8e9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2506_c6_9273] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_left;
     BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output := BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2514_c11_9608] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_left;
     BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output := BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c6_9273_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_e7b5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9608_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_8e9c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_c309_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2529_c11_7488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_d380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2538_c11_73c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2518_l2514_l2511_l2506_DUPLICATE_5927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2518_l2514_l2511_l2506_DUPLICATE_5927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2518_l2514_l2511_l2506_DUPLICATE_5927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2518_l2514_l2511_l2506_DUPLICATE_5927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2518_l2514_l2511_l2506_DUPLICATE_5927_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2529_l2521_l2518_l2514_l2511_l2538_l2534_DUPLICATE_7087_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2506_DUPLICATE_d6eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2506_DUPLICATE_d6eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2506_DUPLICATE_d6eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2506_DUPLICATE_d6eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2506_DUPLICATE_d6eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2529_l2518_l2514_l2511_l2538_l2506_l2534_DUPLICATE_e3a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2518_l2534_DUPLICATE_5afb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2518_l2534_DUPLICATE_5afb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2518_l2514_l2511_l2506_l2534_DUPLICATE_988d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2518_l2514_l2511_l2506_l2534_DUPLICATE_988d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2518_l2514_l2511_l2506_l2534_DUPLICATE_988d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2518_l2514_l2511_l2506_l2534_DUPLICATE_988d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2518_l2514_l2511_l2506_l2534_DUPLICATE_988d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2524_c30_7ab3_return_output;
     -- n8_MUX[uxn_opcodes_h_l2518_c7_15f4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond;
     n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue;
     n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output := n8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_0432] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_return_output := result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_return_output;

     -- t8_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := t8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- l8_MUX[uxn_opcodes_h_l2521_c7_1c5f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond <= VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond;
     l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue;
     l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output := l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2538_c7_c295] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2506_c1_90e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_0432] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_1c5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2529_c7_cc8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2538_c7_c295] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2507_c3_06dc_uxn_opcodes_h_l2507_c3_06dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2506_c1_90e6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2538_c7_c295_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2538_c7_c295_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_0432_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_0432_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     -- t8_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     t8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     t8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := t8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- n8_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := n8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- printf_uxn_opcodes_h_l2507_c3_06dc[uxn_opcodes_h_l2507_c3_06dc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2507_c3_06dc_uxn_opcodes_h_l2507_c3_06dc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2507_c3_06dc_uxn_opcodes_h_l2507_c3_06dc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_0432] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_return_output;

     -- l8_MUX[uxn_opcodes_h_l2518_c7_15f4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond <= VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_cond;
     l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue;
     l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output := l8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2529_c7_cc8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_15f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_0432] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2521_c7_1c5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2529_c7_cc8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_0432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_0432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_1c5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2518_c7_15f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2529_c7_cc8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- l8_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := l8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_1c5f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := t8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2529_c7_cc8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     n8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     n8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := n8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2529_c7_cc8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;
     -- n8_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := n8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_1c5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;

     -- l8_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     l8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     l8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := l8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_15f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_15f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_1c5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_1c5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_15f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- l8_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := l8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_15f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- Submodule level 6
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_15f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2514_c7_0cae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2514_c7_0cae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2511_c7_1931] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_1931_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2506_c2_6ace] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2502_l2543_DUPLICATE_a191 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2502_l2543_DUPLICATE_a191_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c2_6ace_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2502_l2543_DUPLICATE_a191_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2502_l2543_DUPLICATE_a191_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
