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
-- Submodules: 96
entity rot_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_9c3c4e32;
architecture arch of rot_0CLK_9c3c4e32 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2565_c6_1643]
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2565_c1_26ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal n8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal t8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2565_c2_88b6]
signal l8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2566_c3_4640[uxn_opcodes_h_l2566_c3_4640]
signal printf_uxn_opcodes_h_l2566_c3_4640_uxn_opcodes_h_l2566_c3_4640_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_b0c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2571_c7_2dfe]
signal l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2574_c11_75b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2574_c7_6817]
signal n8_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2574_c7_6817]
signal t8_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2574_c7_6817]
signal result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2574_c7_6817]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2574_c7_6817]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2574_c7_6817]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2574_c7_6817]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2574_c7_6817]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2574_c7_6817]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2574_c7_6817]
signal l8_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2578_c11_3a10]
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal n8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2578_c7_54fb]
signal l8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2581_c11_b000]
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2581_c7_1499]
signal n8_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2581_c7_1499]
signal result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2581_c7_1499]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2581_c7_1499]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2581_c7_1499]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2581_c7_1499]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2581_c7_1499]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2581_c7_1499]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2581_c7_1499]
signal l8_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2585_c11_02e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2585_c7_9f6d]
signal result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c7_9f6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2585_c7_9f6d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2585_c7_9f6d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c7_9f6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c7_9f6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c7_9f6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2585_c7_9f6d]
signal l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_f2e3]
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2588_c7_344e]
signal result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_344e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2588_c7_344e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2588_c7_344e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2588_c7_344e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2588_c7_344e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_344e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2588_c7_344e]
signal l8_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2592_c32_ca23]
signal BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2592_c32_1b3d]
signal BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2592_c32_b265]
signal MUX_uxn_opcodes_h_l2592_c32_b265_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2592_c32_b265_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2592_c32_b265_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2592_c32_b265_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2594_c11_9903]
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2594_c7_f4cf]
signal result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2594_c7_f4cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2594_c7_f4cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2594_c7_f4cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2594_c7_f4cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_d959]
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2600_c7_4fb7]
signal result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_4fb7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_4fb7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_4fb7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_c5ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2604_c7_edf2]
signal result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_edf2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2604_c7_edf2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_edf2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2608_c11_2fd2]
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2608_c7_8687]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2608_c7_8687]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643
BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_left,
BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_right,
BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_return_output);

-- n8_MUX_uxn_opcodes_h_l2565_c2_88b6
n8_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
n8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- t8_MUX_uxn_opcodes_h_l2565_c2_88b6
t8_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
t8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6
result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6
result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- l8_MUX_uxn_opcodes_h_l2565_c2_88b6
l8_MUX_uxn_opcodes_h_l2565_c2_88b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond,
l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue,
l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse,
l8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

-- printf_uxn_opcodes_h_l2566_c3_4640_uxn_opcodes_h_l2566_c3_4640
printf_uxn_opcodes_h_l2566_c3_4640_uxn_opcodes_h_l2566_c3_4640 : entity work.printf_uxn_opcodes_h_l2566_c3_4640_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2566_c3_4640_uxn_opcodes_h_l2566_c3_4640_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output);

-- n8_MUX_uxn_opcodes_h_l2571_c7_2dfe
n8_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- t8_MUX_uxn_opcodes_h_l2571_c7_2dfe
t8_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe
result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe
result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- l8_MUX_uxn_opcodes_h_l2571_c7_2dfe
l8_MUX_uxn_opcodes_h_l2571_c7_2dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond,
l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue,
l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse,
l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output);

-- n8_MUX_uxn_opcodes_h_l2574_c7_6817
n8_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
n8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
n8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
n8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- t8_MUX_uxn_opcodes_h_l2574_c7_6817
t8_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
t8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
t8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
t8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817
result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817
result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- l8_MUX_uxn_opcodes_h_l2574_c7_6817
l8_MUX_uxn_opcodes_h_l2574_c7_6817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2574_c7_6817_cond,
l8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue,
l8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse,
l8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_left,
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_right,
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output);

-- n8_MUX_uxn_opcodes_h_l2578_c7_54fb
n8_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
n8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb
result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb
result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- l8_MUX_uxn_opcodes_h_l2578_c7_54fb
l8_MUX_uxn_opcodes_h_l2578_c7_54fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond,
l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue,
l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse,
l8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_left,
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_right,
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output);

-- n8_MUX_uxn_opcodes_h_l2581_c7_1499
n8_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
n8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
n8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
n8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499
result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499
result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- l8_MUX_uxn_opcodes_h_l2581_c7_1499
l8_MUX_uxn_opcodes_h_l2581_c7_1499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2581_c7_1499_cond,
l8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue,
l8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse,
l8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d
result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d
result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d
result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output);

-- l8_MUX_uxn_opcodes_h_l2585_c7_9f6d
l8_MUX_uxn_opcodes_h_l2585_c7_9f6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond,
l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue,
l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse,
l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_left,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_right,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e
result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e
result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e
result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_return_output);

-- l8_MUX_uxn_opcodes_h_l2588_c7_344e
l8_MUX_uxn_opcodes_h_l2588_c7_344e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2588_c7_344e_cond,
l8_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue,
l8_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse,
l8_MUX_uxn_opcodes_h_l2588_c7_344e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23
BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_left,
BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_right,
BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d
BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_left,
BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_right,
BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_return_output);

-- MUX_uxn_opcodes_h_l2592_c32_b265
MUX_uxn_opcodes_h_l2592_c32_b265 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2592_c32_b265_cond,
MUX_uxn_opcodes_h_l2592_c32_b265_iftrue,
MUX_uxn_opcodes_h_l2592_c32_b265_iffalse,
MUX_uxn_opcodes_h_l2592_c32_b265_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_left,
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_right,
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_left,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_right,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2
result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2
BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_left,
BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_right,
BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_return_output,
 n8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 t8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 l8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output,
 n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output,
 n8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 t8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 l8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output,
 n8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 l8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output,
 n8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 l8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output,
 l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_return_output,
 l8_MUX_uxn_opcodes_h_l2588_c7_344e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_return_output,
 MUX_uxn_opcodes_h_l2592_c32_b265_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_f8fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2566_c3_4640_uxn_opcodes_h_l2566_c3_4640_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2572_c3_73eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_1681 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_89c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2583_c3_431e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2586_c3_7cbb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2592_c32_b265_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2592_c32_b265_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2592_c32_b265_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2592_c32_b265_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_529b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_0275 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2605_c3_78a2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2588_l2604_DUPLICATE_a9d7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2613_l2561_DUPLICATE_85d0_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2592_c32_b265_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_0275 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_0275;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2572_c3_73eb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2572_c3_73eb;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2605_c3_78a2 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2605_c3_78a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_89c6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_89c6;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2592_c32_b265_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_1681 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_1681;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_f8fd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_f8fd;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2586_c3_7cbb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2586_c3_7cbb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_529b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_529b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2583_c3_431e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2583_c3_431e;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_left := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse := l8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := t8;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_c5ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2578_c11_3a10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2574_c11_75b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_b0c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c11_02e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2592_c32_ca23] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_left;
     BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_return_output := BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2594_c11_9903] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_left;
     BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output := BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2581_c11_b000] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_left;
     BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output := BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_d959] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_left;
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output := BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2565_c6_1643] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_left;
     BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output := BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2588_l2604_DUPLICATE_a9d7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2588_l2604_DUPLICATE_a9d7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_f2e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2608_c11_2fd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2592_c32_ca23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_1643_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_b0c9_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_75b2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_3a10_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_b000_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_02e2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f2e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_9903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_d959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c5ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2608_c11_2fd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_1edd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2594_l2588_l2585_l2581_DUPLICATE_e59d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2594_l2565_l2585_l2581_DUPLICATE_48f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2578_l2574_l2571_l2588_l2585_l2581_DUPLICATE_7015_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2608_l2578_l2604_l2574_l2600_l2571_l2565_l2588_l2585_l2581_DUPLICATE_29ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2588_l2604_DUPLICATE_a9d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2588_l2604_DUPLICATE_a9d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2578_l2604_l2574_l2571_l2565_l2588_l2585_l2581_DUPLICATE_a3f9_return_output;
     -- l8_MUX[uxn_opcodes_h_l2588_c7_344e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2588_c7_344e_cond <= VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_cond;
     l8_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue;
     l8_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_return_output := l8_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2608_c7_8687] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2604_c7_edf2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2594_c7_f4cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2588_c7_344e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     t8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     t8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := t8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2608_c7_8687] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2604_c7_edf2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     n8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     n8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := n8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2565_c1_26ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2592_c32_1b3d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_left;
     BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_return_output := BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2592_c32_b265_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2592_c32_1b3d_return_output;
     VAR_printf_uxn_opcodes_h_l2566_c3_4640_uxn_opcodes_h_l2566_c3_4640_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2565_c1_26ff_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2608_c7_8687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2608_c7_8687_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2588_c7_344e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2600_c7_4fb7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_edf2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2585_c7_9f6d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_4fb7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output;

     -- l8_MUX[uxn_opcodes_h_l2585_c7_9f6d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond <= VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond;
     l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue;
     l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output := l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;

     -- MUX[uxn_opcodes_h_l2592_c32_b265] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2592_c32_b265_cond <= VAR_MUX_uxn_opcodes_h_l2592_c32_b265_cond;
     MUX_uxn_opcodes_h_l2592_c32_b265_iftrue <= VAR_MUX_uxn_opcodes_h_l2592_c32_b265_iftrue;
     MUX_uxn_opcodes_h_l2592_c32_b265_iffalse <= VAR_MUX_uxn_opcodes_h_l2592_c32_b265_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2592_c32_b265_return_output := MUX_uxn_opcodes_h_l2592_c32_b265_return_output;

     -- printf_uxn_opcodes_h_l2566_c3_4640[uxn_opcodes_h_l2566_c3_4640] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2566_c3_4640_uxn_opcodes_h_l2566_c3_4640_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2566_c3_4640_uxn_opcodes_h_l2566_c3_4640_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_edf2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := n8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue := VAR_MUX_uxn_opcodes_h_l2592_c32_b265_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_edf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2585_c7_9f6d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_4fb7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output;

     -- l8_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     l8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     l8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := l8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- t8_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := t8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_4fb7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2594_c7_f4cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2588_c7_344e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     n8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     n8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := n8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2594_c7_f4cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_4fb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2594_c7_f4cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c7_9f6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- l8_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := l8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2594_c7_f4cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_344e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2588_c7_344e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_f4cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2588_c7_344e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := n8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_344e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2585_c7_9f6d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;

     -- l8_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     l8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     l8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := l8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c7_9f6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_344e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c7_9f6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c7_9f6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- l8_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c7_9f6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- l8_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := l8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2581_c7_1499] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_1499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2578_c7_54fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_54fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2574_c7_6817] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_6817_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_2dfe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_2dfe_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2565_c2_88b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2613_l2561_DUPLICATE_85d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2613_l2561_DUPLICATE_85d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_88b6_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2613_l2561_DUPLICATE_85d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2613_l2561_DUPLICATE_85d0_return_output;
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
