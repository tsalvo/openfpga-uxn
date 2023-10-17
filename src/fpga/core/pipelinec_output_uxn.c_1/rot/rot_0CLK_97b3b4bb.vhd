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
-- Submodules: 82
entity rot_0CLK_97b3b4bb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_97b3b4bb;
architecture arch of rot_0CLK_97b3b4bb is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2815_c6_a81e]
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2815_c1_61fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal l8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal n8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal t8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2815_c2_35c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l2816_c3_8397[uxn_opcodes_h_l2816_c3_8397]
signal printf_uxn_opcodes_h_l2816_c3_8397_uxn_opcodes_h_l2816_c3_8397_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2820_c11_6896]
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal l8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal n8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal t8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2820_c7_5d25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_002c]
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal l8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal n8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal t8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2823_c7_e56f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2827_c11_e235]
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2827_c7_197d]
signal l8_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2827_c7_197d]
signal n8_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2827_c7_197d]
signal result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2827_c7_197d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2827_c7_197d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2827_c7_197d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2827_c7_197d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2827_c7_197d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_9107]
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2830_c7_ac59]
signal l8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2830_c7_ac59]
signal n8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2830_c7_ac59]
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2830_c7_ac59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2830_c7_ac59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2830_c7_ac59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2830_c7_ac59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2830_c7_ac59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2834_c11_77b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2834_c7_a6eb]
signal l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2834_c7_a6eb]
signal result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2834_c7_a6eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2834_c7_a6eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2834_c7_a6eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2834_c7_a6eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2834_c7_a6eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_3b73]
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2837_c7_0d06]
signal l8_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2837_c7_0d06]
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_0d06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_0d06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_0d06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_0d06]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_0d06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2840_c30_c41e]
signal sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_8235]
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2845_c7_f6f9]
signal result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2845_c7_f6f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2845_c7_f6f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2845_c7_f6f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2845_c7_f6f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_b65a]
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2850_c7_ac5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2850_c7_ac5d]
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2850_c7_ac5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2850_c7_ac5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_e6d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2854_c7_3cec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2854_c7_3cec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_left,
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_right,
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_return_output);

-- l8_MUX_uxn_opcodes_h_l2815_c2_35c2
l8_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
l8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- n8_MUX_uxn_opcodes_h_l2815_c2_35c2
n8_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
n8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- t8_MUX_uxn_opcodes_h_l2815_c2_35c2
t8_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
t8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

-- printf_uxn_opcodes_h_l2816_c3_8397_uxn_opcodes_h_l2816_c3_8397
printf_uxn_opcodes_h_l2816_c3_8397_uxn_opcodes_h_l2816_c3_8397 : entity work.printf_uxn_opcodes_h_l2816_c3_8397_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2816_c3_8397_uxn_opcodes_h_l2816_c3_8397_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_left,
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_right,
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output);

-- l8_MUX_uxn_opcodes_h_l2820_c7_5d25
l8_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
l8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- n8_MUX_uxn_opcodes_h_l2820_c7_5d25
n8_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
n8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- t8_MUX_uxn_opcodes_h_l2820_c7_5d25
t8_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
t8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_left,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_right,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output);

-- l8_MUX_uxn_opcodes_h_l2823_c7_e56f
l8_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
l8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- n8_MUX_uxn_opcodes_h_l2823_c7_e56f
n8_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
n8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- t8_MUX_uxn_opcodes_h_l2823_c7_e56f
t8_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
t8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_left,
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_right,
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output);

-- l8_MUX_uxn_opcodes_h_l2827_c7_197d
l8_MUX_uxn_opcodes_h_l2827_c7_197d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2827_c7_197d_cond,
l8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue,
l8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse,
l8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output);

-- n8_MUX_uxn_opcodes_h_l2827_c7_197d
n8_MUX_uxn_opcodes_h_l2827_c7_197d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2827_c7_197d_cond,
n8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue,
n8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse,
n8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_left,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_right,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output);

-- l8_MUX_uxn_opcodes_h_l2830_c7_ac59
l8_MUX_uxn_opcodes_h_l2830_c7_ac59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond,
l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue,
l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse,
l8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output);

-- n8_MUX_uxn_opcodes_h_l2830_c7_ac59
n8_MUX_uxn_opcodes_h_l2830_c7_ac59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond,
n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue,
n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse,
n8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_cond,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output);

-- l8_MUX_uxn_opcodes_h_l2834_c7_a6eb
l8_MUX_uxn_opcodes_h_l2834_c7_a6eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond,
l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue,
l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse,
l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_left,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_right,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output);

-- l8_MUX_uxn_opcodes_h_l2837_c7_0d06
l8_MUX_uxn_opcodes_h_l2837_c7_0d06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2837_c7_0d06_cond,
l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue,
l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse,
l8_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_cond,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e
sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_ins,
sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_x,
sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_y,
sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_left,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_right,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_left,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_right,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_return_output,
 l8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 n8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 t8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output,
 l8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 n8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 t8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output,
 l8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 n8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 t8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output,
 l8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output,
 n8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output,
 l8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output,
 n8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output,
 l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output,
 l8_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output,
 sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2817_c3_b97a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2816_c3_8397_uxn_opcodes_h_l2816_c3_8397_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2821_c3_0901 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2825_c3_37cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_87b4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2832_c3_31a3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_d7b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_fc6c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_ba2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2851_c3_221e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2850_c7_ac5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2811_l2859_DUPLICATE_db62_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2851_c3_221e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2851_c3_221e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2832_c3_31a3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2832_c3_31a3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_ba2e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2847_c3_ba2e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2825_c3_37cb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2825_c3_37cb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_fc6c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_fc6c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2817_c3_b97a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2817_c3_b97a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2821_c3_0901 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2821_c3_0901;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_d7b2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_d7b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_87b4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_87b4;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2834_c11_77b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2840_c30_c41e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_ins;
     sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_x;
     sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_return_output := sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_002c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2850_c7_ac5d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2850_c7_ac5d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2827_c11_e235] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_left;
     BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output := BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_b65a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_9107] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_left;
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output := BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2820_c11_6896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_left;
     BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output := BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_8235] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_left;
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output := BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2815_c6_a81e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_e6d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_3b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_a81e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_6896_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_002c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_e235_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_9107_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_77b5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_3b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_8235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_b65a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_e6d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2815_l2837_l2834_l2830_DUPLICATE_d7da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2837_l2834_l2830_DUPLICATE_1187_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2827_l2823_l2820_l2845_l2815_l2834_l2830_DUPLICATE_f953_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2827_l2854_l2823_l2850_l2820_l2845_l2815_l2834_l2830_DUPLICATE_3b08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2827_l2823_l2850_l2820_l2815_l2834_l2830_DUPLICATE_3937_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2850_c7_ac5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2840_c30_c41e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2845_c7_f6f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2854_c7_3cec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_0d06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2850_c7_ac5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output;

     -- l8_MUX[uxn_opcodes_h_l2837_c7_0d06] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2837_c7_0d06_cond <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_cond;
     l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue;
     l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output := l8_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2854_c7_3cec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output;

     -- n8_MUX[uxn_opcodes_h_l2830_c7_ac59] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond;
     n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue;
     n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output := n8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2815_c1_61fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2850_c7_ac5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := t8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2816_c3_8397_uxn_opcodes_h_l2816_c3_8397_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_61fb_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2854_c7_3cec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2845_c7_f6f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_0d06] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2850_c7_ac5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output;

     -- printf_uxn_opcodes_h_l2816_c3_8397[uxn_opcodes_h_l2816_c3_8397] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2816_c3_8397_uxn_opcodes_h_l2816_c3_8397_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2816_c3_8397_uxn_opcodes_h_l2816_c3_8397_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2850_c7_ac5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2827_c7_197d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2827_c7_197d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_cond;
     n8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue;
     n8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output := n8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2834_c7_a6eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;

     -- l8_MUX[uxn_opcodes_h_l2834_c7_a6eb] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond <= VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond;
     l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue;
     l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output := l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := t8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2845_c7_f6f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2850_c7_ac5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2834_c7_a6eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_0d06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2845_c7_f6f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2837_c7_0d06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output := result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;

     -- n8_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := n8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2845_c7_f6f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;

     -- l8_MUX[uxn_opcodes_h_l2830_c7_ac59] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_cond;
     l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue;
     l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output := l8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;

     -- t8_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := t8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2830_c7_ac59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_f6f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2834_c7_a6eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := n8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_0d06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2827_c7_197d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;

     -- l8_MUX[uxn_opcodes_h_l2827_c7_197d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2827_c7_197d_cond <= VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_cond;
     l8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue;
     l8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output := l8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2830_c7_ac59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2834_c7_a6eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_0d06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_0d06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2830_c7_ac59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2827_c7_197d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2834_c7_a6eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2830_c7_ac59] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output := result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2834_c7_a6eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- l8_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := l8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := n8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2834_c7_a6eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2830_c7_ac59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;

     -- l8_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := l8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2830_c7_ac59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2827_c7_197d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2827_c7_197d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_ac59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2827_c7_197d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2827_c7_197d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- l8_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := l8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2827_c7_197d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2823_c7_e56f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_e56f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2820_c7_5d25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c7_5d25_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2815_c2_35c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2811_l2859_DUPLICATE_db62 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2811_l2859_DUPLICATE_db62_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_35c2_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2811_l2859_DUPLICATE_db62_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2811_l2859_DUPLICATE_db62_return_output;
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
