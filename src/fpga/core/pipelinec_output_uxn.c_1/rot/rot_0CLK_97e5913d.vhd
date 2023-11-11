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
-- BIN_OP_EQ[uxn_opcodes_h_l2505_c6_3057]
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2505_c1_498c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal l8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal n8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal t8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2505_c2_8f86]
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2506_c3_369a[uxn_opcodes_h_l2506_c3_369a]
signal printf_uxn_opcodes_h_l2506_c3_369a_uxn_opcodes_h_l2506_c3_369a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_8326]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_8b6a]
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_e4e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal l8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal n8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal t8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_ea14]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_fed4]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2517_c7_4eef]
signal l8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2517_c7_4eef]
signal n8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_4eef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_4eef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_4eef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_4eef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_4eef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_4eef]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_5a77]
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2520_c7_5064]
signal l8_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_5064]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2520_c7_5064]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_5064]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_5064]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_5064]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2520_c7_5064]
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2523_c30_f071]
signal sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2528_c11_48d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2528_c7_f0e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2528_c7_f0e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c7_f0e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2528_c7_f0e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2528_c7_f0e2]
signal result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_1808]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_6743]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2533_c7_6743]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_6743]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_6743]
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2537_c11_0887]
signal BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2537_c7_1fa4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2537_c7_1fa4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_left,
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_right,
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_return_output);

-- l8_MUX_uxn_opcodes_h_l2505_c2_8f86
l8_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
l8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- n8_MUX_uxn_opcodes_h_l2505_c2_8f86
n8_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
n8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- t8_MUX_uxn_opcodes_h_l2505_c2_8f86
t8_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
t8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_cond,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

-- printf_uxn_opcodes_h_l2506_c3_369a_uxn_opcodes_h_l2506_c3_369a
printf_uxn_opcodes_h_l2506_c3_369a_uxn_opcodes_h_l2506_c3_369a : entity work.printf_uxn_opcodes_h_l2506_c3_369a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2506_c3_369a_uxn_opcodes_h_l2506_c3_369a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output);

-- l8_MUX_uxn_opcodes_h_l2510_c7_8b6a
l8_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- n8_MUX_uxn_opcodes_h_l2510_c7_8b6a
n8_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- t8_MUX_uxn_opcodes_h_l2510_c7_8b6a
t8_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output);

-- l8_MUX_uxn_opcodes_h_l2513_c7_ea14
l8_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
l8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- n8_MUX_uxn_opcodes_h_l2513_c7_ea14
n8_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
n8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- t8_MUX_uxn_opcodes_h_l2513_c7_ea14
t8_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
t8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output);

-- l8_MUX_uxn_opcodes_h_l2517_c7_4eef
l8_MUX_uxn_opcodes_h_l2517_c7_4eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond,
l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue,
l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse,
l8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output);

-- n8_MUX_uxn_opcodes_h_l2517_c7_4eef
n8_MUX_uxn_opcodes_h_l2517_c7_4eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond,
n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue,
n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse,
n8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_left,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_right,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output);

-- l8_MUX_uxn_opcodes_h_l2520_c7_5064
l8_MUX_uxn_opcodes_h_l2520_c7_5064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2520_c7_5064_cond,
l8_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue,
l8_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse,
l8_MUX_uxn_opcodes_h_l2520_c7_5064_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_cond,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2523_c30_f071
sp_relative_shift_uxn_opcodes_h_l2523_c30_f071 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_ins,
sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_x,
sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_y,
sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2
result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_cond,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887
BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_left,
BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_right,
BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_return_output,
 l8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 n8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 t8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output,
 l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output,
 l8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 n8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 t8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output,
 l8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output,
 n8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output,
 l8_MUX_uxn_opcodes_h_l2520_c7_5064_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_return_output,
 sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_78c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2506_c3_369a_uxn_opcodes_h_l2506_c3_369a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_5ec5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_638a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2525_c3_fd6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_fbdf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2534_c3_192f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2528_DUPLICATE_82a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2520_DUPLICATE_e794_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2533_DUPLICATE_7f39_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2517_l2533_DUPLICATE_c817_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2542_l2501_DUPLICATE_8b96_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_78c5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_78c5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2525_c3_fd6e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2525_c3_fd6e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_fbdf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_fbdf;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_5ec5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_5ec5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_638a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_638a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2534_c3_192f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2534_c3_192f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2520_DUPLICATE_e794 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2520_DUPLICATE_e794_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2528_c11_48d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_e4e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2528_DUPLICATE_82a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2528_DUPLICATE_82a2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2533_DUPLICATE_7f39 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2533_DUPLICATE_7f39_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_1808] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_fed4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_5a77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_left;
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output := BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2537_c11_0887] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_left;
     BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_return_output := BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_8326] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2505_c6_3057] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_left;
     BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output := BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2517_l2533_DUPLICATE_c817 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2517_l2533_DUPLICATE_c817_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2523_c30_f071] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_ins;
     sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_x;
     sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_return_output := sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_3057_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_8326_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_e4e7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_fed4_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_5a77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_48d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_1808_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2537_c11_0887_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2520_DUPLICATE_e794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2520_DUPLICATE_e794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2520_DUPLICATE_e794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2520_DUPLICATE_e794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2520_DUPLICATE_e794_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2533_l2528_l2520_DUPLICATE_303a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2528_DUPLICATE_82a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2528_DUPLICATE_82a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2528_DUPLICATE_82a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2528_DUPLICATE_82a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2528_DUPLICATE_82a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2537_l2505_l2533_l2528_DUPLICATE_c2b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2517_l2533_DUPLICATE_c817_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2517_l2533_DUPLICATE_c817_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2533_DUPLICATE_7f39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2533_DUPLICATE_7f39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2533_DUPLICATE_7f39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2533_DUPLICATE_7f39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2517_l2513_l2510_l2505_l2533_DUPLICATE_7f39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2523_c30_f071_return_output;
     -- n8_MUX[uxn_opcodes_h_l2517_c7_4eef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond;
     n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue;
     n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output := n8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;

     -- l8_MUX[uxn_opcodes_h_l2520_c7_5064] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2520_c7_5064_cond <= VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_cond;
     l8_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue;
     l8_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_return_output := l8_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2537_c7_1fa4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2537_c7_1fa4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_6743] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2505_c1_498c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_5064] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;

     -- t8_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := t8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2528_c7_f0e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_6743] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_return_output := result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2506_c3_369a_uxn_opcodes_h_l2506_c3_369a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_498c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2537_c7_1fa4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_6743_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_6743_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_4eef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;

     -- t8_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2517_c7_4eef] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_cond;
     l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue;
     l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output := l8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2528_c7_f0e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;

     -- printf_uxn_opcodes_h_l2506_c3_369a[uxn_opcodes_h_l2506_c3_369a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2506_c3_369a_uxn_opcodes_h_l2506_c3_369a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2506_c3_369a_uxn_opcodes_h_l2506_c3_369a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2528_c7_f0e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_5064] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_6743] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_return_output;

     -- n8_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := n8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2533_c7_6743] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_6743_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_6743_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2520_c7_5064] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_return_output := result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;

     -- n8_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2528_c7_f0e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_5064] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;

     -- t8_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := t8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_4eef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c7_f0e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;

     -- l8_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := l8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_f0e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- l8_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_5064] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_4eef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;

     -- n8_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := n8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2520_c7_5064] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_4eef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_5064_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_4eef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- l8_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := l8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_4eef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- Submodule level 6
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_4eef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_ea14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_ea14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_8b6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8b6a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c2_8f86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2542_l2501_DUPLICATE_8b96 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2542_l2501_DUPLICATE_8b96_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_8f86_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2542_l2501_DUPLICATE_8b96_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2542_l2501_DUPLICATE_8b96_return_output;
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
