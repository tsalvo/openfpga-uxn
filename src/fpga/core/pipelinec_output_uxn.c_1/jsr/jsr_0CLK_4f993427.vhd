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
-- Submodules: 66
entity jsr_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_4f993427;
architecture arch of jsr_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l712_c6_21b2]
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l712_c1_de84]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l712_c2_872a]
signal t8_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l712_c2_872a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l713_c3_75e1[uxn_opcodes_h_l713_c3_75e1]
signal printf_uxn_opcodes_h_l713_c3_75e1_uxn_opcodes_h_l713_c3_75e1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_5eeb]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l717_c7_34d7]
signal t8_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l717_c7_34d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c11_7e69]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l720_c7_b77f]
signal t8_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l720_c7_b77f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l723_c30_1768]
signal sp_relative_shift_uxn_opcodes_h_l723_c30_1768_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_1768_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_1768_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_1768_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l725_c11_7c43]
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l725_c7_9534]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l732_c11_d57a]
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_65f7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l732_c7_65f7]
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l732_c7_65f7]
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l732_c7_65f7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_65f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_65f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l732_c7_65f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_65f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l735_c31_d92e]
signal CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l737_c22_a6d6]
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l739_c11_12e1]
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_e8f4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l739_c7_e8f4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_e8f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l739_c7_e8f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3b30( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2
BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_left,
BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_right,
BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_return_output);

-- t8_MUX_uxn_opcodes_h_l712_c2_872a
t8_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l712_c2_872a_cond,
t8_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
t8_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
t8_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a
result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a
result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

-- printf_uxn_opcodes_h_l713_c3_75e1_uxn_opcodes_h_l713_c3_75e1
printf_uxn_opcodes_h_l713_c3_75e1_uxn_opcodes_h_l713_c3_75e1 : entity work.printf_uxn_opcodes_h_l713_c3_75e1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l713_c3_75e1_uxn_opcodes_h_l713_c3_75e1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output);

-- t8_MUX_uxn_opcodes_h_l717_c7_34d7
t8_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
t8_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
t8_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
t8_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7
result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7
result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69
BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output);

-- t8_MUX_uxn_opcodes_h_l720_c7_b77f
t8_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
t8_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
t8_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
t8_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f
result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f
result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l723_c30_1768
sp_relative_shift_uxn_opcodes_h_l723_c30_1768 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l723_c30_1768_ins,
sp_relative_shift_uxn_opcodes_h_l723_c30_1768_x,
sp_relative_shift_uxn_opcodes_h_l723_c30_1768_y,
sp_relative_shift_uxn_opcodes_h_l723_c30_1768_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43
BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_left,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_right,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534
result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534
result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a
BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_left,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_right,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7
result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7
result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l735_c31_d92e
CONST_SR_8_uxn_opcodes_h_l735_c31_d92e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_x,
CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_left,
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_right,
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1
BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_left,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_right,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_return_output,
 t8_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output,
 t8_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output,
 t8_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_return_output,
 sp_relative_shift_uxn_opcodes_h_l723_c30_1768_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_return_output,
 CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_759d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l713_c3_75e1_uxn_opcodes_h_l713_c3_75e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_46f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_eb1d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_212c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_4764_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l737_c3_f9b4 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_2b65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_8040_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_d08f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l720_l725_l717_l712_l739_DUPLICATE_00a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l720_l725_l717_l712_DUPLICATE_179d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l712_l720_l717_DUPLICATE_70d9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l712_l717_DUPLICATE_7fd2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_caaf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l732_l712_l717_DUPLICATE_eec0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_3e34_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l720_l725_l717_l739_DUPLICATE_8d95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_46ed_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l746_l708_DUPLICATE_b705_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_2b65 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_2b65;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_46f4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_46f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_eb1d := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_eb1d;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_212c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_212c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_759d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_759d;
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l720_l725_l717_l712_l739_DUPLICATE_00a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l720_l725_l717_l712_l739_DUPLICATE_00a7_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_46ed LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_46ed_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l732_l712_l717_DUPLICATE_eec0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l732_l712_l717_DUPLICATE_eec0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_5eeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l712_l717_DUPLICATE_7fd2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l712_l717_DUPLICATE_7fd2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l712_l720_l717_DUPLICATE_70d9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l712_l720_l717_DUPLICATE_70d9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l732_c11_d57a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_left;
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output := BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l712_c6_21b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l737_c27_d08f] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_d08f_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l730_c21_4764] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_4764_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l720_l725_l717_l712_DUPLICATE_179d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l720_l725_l717_l712_DUPLICATE_179d_return_output := result.u16_value;

     -- CONST_SR_8[uxn_opcodes_h_l735_c31_d92e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_return_output := CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l720_l725_l717_l739_DUPLICATE_8d95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l720_l725_l717_l739_DUPLICATE_8d95_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_caaf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_caaf_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_3e34 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_3e34_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l723_c30_1768] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l723_c30_1768_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_ins;
     sp_relative_shift_uxn_opcodes_h_l723_c30_1768_x <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_x;
     sp_relative_shift_uxn_opcodes_h_l723_c30_1768_y <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_return_output := sp_relative_shift_uxn_opcodes_h_l723_c30_1768_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l739_c11_12e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l720_c11_7e69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l725_c11_7c43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_left;
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output := BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_21b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5eeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7e69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_7c43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_d57a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_12e1_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_d08f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_4764_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l712_l717_DUPLICATE_7fd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l712_l717_DUPLICATE_7fd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l725_l712_l717_DUPLICATE_7fd2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l720_l725_l717_l712_DUPLICATE_179d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l720_l725_l717_l712_DUPLICATE_179d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l720_l725_l717_l712_DUPLICATE_179d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l720_l725_l717_l712_DUPLICATE_179d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l732_l720_l725_l717_l712_DUPLICATE_179d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l720_l725_l717_l739_DUPLICATE_8d95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l720_l725_l717_l739_DUPLICATE_8d95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l720_l725_l717_l739_DUPLICATE_8d95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l720_l725_l717_l739_DUPLICATE_8d95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l732_l720_l725_l717_l739_DUPLICATE_8d95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l720_l725_l717_l712_l739_DUPLICATE_00a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l720_l725_l717_l712_l739_DUPLICATE_00a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l720_l725_l717_l712_l739_DUPLICATE_00a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l720_l725_l717_l712_l739_DUPLICATE_00a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l720_l725_l717_l712_l739_DUPLICATE_00a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l732_l712_l717_DUPLICATE_eec0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l732_l712_l717_DUPLICATE_eec0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l732_l712_l717_DUPLICATE_eec0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l725_l732_l712_l717_DUPLICATE_eec0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_caaf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_caaf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_caaf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_caaf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_caaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_3e34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_3e34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_3e34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_3e34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l732_l720_l717_l712_l739_DUPLICATE_3e34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_46ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_46ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l712_l720_l717_DUPLICATE_70d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l712_l720_l717_DUPLICATE_70d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l712_l720_l717_DUPLICATE_70d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l732_l712_l720_l717_DUPLICATE_70d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_1768_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l739_c7_e8f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     t8_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     t8_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := t8_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_65f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l737_c22_a6d6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_65f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l712_c1_de84] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_e8f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l735_c21_8040] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_8040_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_d92e_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l739_c7_e8f4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_e8f4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l737_c3_f9b4 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_a6d6_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_8040_return_output;
     VAR_printf_uxn_opcodes_h_l713_c3_75e1_uxn_opcodes_h_l713_c3_75e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_de84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_e8f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l737_c3_f9b4;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- printf_uxn_opcodes_h_l713_c3_75e1[uxn_opcodes_h_l713_c3_75e1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l713_c3_75e1_uxn_opcodes_h_l713_c3_75e1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l713_c3_75e1_uxn_opcodes_h_l713_c3_75e1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     t8_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     t8_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := t8_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l732_c7_65f7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l732_c7_65f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_65f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l732_c7_65f7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output := result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l732_c7_65f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_65f7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_65f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- t8_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     t8_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     t8_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_return_output := t8_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_9534] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_9534_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l712_c2_872a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l720_c7_b77f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_b77f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_34d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_34d7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l712_c2_872a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l746_l708_DUPLICATE_b705 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l746_l708_DUPLICATE_b705_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3b30(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_872a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_872a_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l746_l708_DUPLICATE_b705_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b30_uxn_opcodes_h_l746_l708_DUPLICATE_b705_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
