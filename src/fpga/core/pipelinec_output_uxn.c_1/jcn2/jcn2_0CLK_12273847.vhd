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
-- Submodules: 50
entity jcn2_0CLK_12273847 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_12273847;
architecture arch of jcn2_0CLK_12273847 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l710_c6_acda]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal n8_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l710_c2_7ad7]
signal t16_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l723_c11_5106]
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l723_c7_fcd0]
signal n8_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l723_c7_fcd0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l723_c7_fcd0]
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l723_c7_fcd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l723_c7_fcd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l723_c7_fcd0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l723_c7_fcd0]
signal t16_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l726_c11_55ea]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l726_c7_2119]
signal n8_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_2119]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l726_c7_2119]
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_2119]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_2119]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_2119]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c7_2119]
signal t16_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l728_c3_da9f]
signal CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l731_c11_4744]
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l731_c7_5fae]
signal n8_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_5fae]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l731_c7_5fae]
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_5fae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_5fae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l731_c7_5fae]
signal t16_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l732_c3_6689]
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l734_c11_4de7]
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l734_c7_0300]
signal n8_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_0300_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_0300]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l734_c7_0300]
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_0300]
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_0300]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l736_c30_e9f5]
signal sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c26_89b0]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l737_c26_ad3d]
signal MUX_uxn_opcodes_h_l737_c26_ad3d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_ad3d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_ad3d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_ad3d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l738_c22_545a]
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l738_c22_d90b]
signal MUX_uxn_opcodes_h_l738_c22_d90b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_d90b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_d90b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_d90b_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_de89( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda
BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output);

-- n8_MUX_uxn_opcodes_h_l710_c2_7ad7
n8_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
n8_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7
result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- t16_MUX_uxn_opcodes_h_l710_c2_7ad7
t16_MUX_uxn_opcodes_h_l710_c2_7ad7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l710_c2_7ad7_cond,
t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue,
t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse,
t16_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106
BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_left,
BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_right,
BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output);

-- n8_MUX_uxn_opcodes_h_l723_c7_fcd0
n8_MUX_uxn_opcodes_h_l723_c7_fcd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l723_c7_fcd0_cond,
n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue,
n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse,
n8_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0
result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_cond,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output);

-- t16_MUX_uxn_opcodes_h_l723_c7_fcd0
t16_MUX_uxn_opcodes_h_l723_c7_fcd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l723_c7_fcd0_cond,
t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue,
t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse,
t16_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea
BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output);

-- n8_MUX_uxn_opcodes_h_l726_c7_2119
n8_MUX_uxn_opcodes_h_l726_c7_2119 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l726_c7_2119_cond,
n8_MUX_uxn_opcodes_h_l726_c7_2119_iftrue,
n8_MUX_uxn_opcodes_h_l726_c7_2119_iffalse,
n8_MUX_uxn_opcodes_h_l726_c7_2119_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119
result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_cond,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c7_2119
t16_MUX_uxn_opcodes_h_l726_c7_2119 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c7_2119_cond,
t16_MUX_uxn_opcodes_h_l726_c7_2119_iftrue,
t16_MUX_uxn_opcodes_h_l726_c7_2119_iffalse,
t16_MUX_uxn_opcodes_h_l726_c7_2119_return_output);

-- CONST_SL_8_uxn_opcodes_h_l728_c3_da9f
CONST_SL_8_uxn_opcodes_h_l728_c3_da9f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_x,
CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744
BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_left,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_right,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output);

-- n8_MUX_uxn_opcodes_h_l731_c7_5fae
n8_MUX_uxn_opcodes_h_l731_c7_5fae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l731_c7_5fae_cond,
n8_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue,
n8_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse,
n8_MUX_uxn_opcodes_h_l731_c7_5fae_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae
result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_cond,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_return_output);

-- t16_MUX_uxn_opcodes_h_l731_c7_5fae
t16_MUX_uxn_opcodes_h_l731_c7_5fae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l731_c7_5fae_cond,
t16_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue,
t16_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse,
t16_MUX_uxn_opcodes_h_l731_c7_5fae_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l732_c3_6689
BIN_OP_OR_uxn_opcodes_h_l732_c3_6689 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_left,
BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_right,
BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7
BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_left,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_right,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output);

-- n8_MUX_uxn_opcodes_h_l734_c7_0300
n8_MUX_uxn_opcodes_h_l734_c7_0300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l734_c7_0300_cond,
n8_MUX_uxn_opcodes_h_l734_c7_0300_iftrue,
n8_MUX_uxn_opcodes_h_l734_c7_0300_iffalse,
n8_MUX_uxn_opcodes_h_l734_c7_0300_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_cond,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_return_output);

-- sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5
sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_ins,
sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_x,
sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_y,
sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0
BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_return_output);

-- MUX_uxn_opcodes_h_l737_c26_ad3d
MUX_uxn_opcodes_h_l737_c26_ad3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l737_c26_ad3d_cond,
MUX_uxn_opcodes_h_l737_c26_ad3d_iftrue,
MUX_uxn_opcodes_h_l737_c26_ad3d_iffalse,
MUX_uxn_opcodes_h_l737_c26_ad3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a
BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_left,
BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_right,
BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_return_output);

-- MUX_uxn_opcodes_h_l738_c22_d90b
MUX_uxn_opcodes_h_l738_c22_d90b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l738_c22_d90b_cond,
MUX_uxn_opcodes_h_l738_c22_d90b_iftrue,
MUX_uxn_opcodes_h_l738_c22_d90b_iffalse,
MUX_uxn_opcodes_h_l738_c22_d90b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output,
 n8_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 t16_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output,
 n8_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output,
 t16_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output,
 n8_MUX_uxn_opcodes_h_l726_c7_2119_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_return_output,
 t16_MUX_uxn_opcodes_h_l726_c7_2119_return_output,
 CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output,
 n8_MUX_uxn_opcodes_h_l731_c7_5fae_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_return_output,
 t16_MUX_uxn_opcodes_h_l731_c7_5fae_return_output,
 BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output,
 n8_MUX_uxn_opcodes_h_l734_c7_0300_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_return_output,
 sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_return_output,
 MUX_uxn_opcodes_h_l737_c26_ad3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_return_output,
 MUX_uxn_opcodes_h_l738_c22_d90b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_1b3b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_e8f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_cb47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_0d6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_2119_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_d90b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_d90b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_d90b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_d90b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l734_l731_l726_l723_DUPLICATE_1221_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_a5a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_8060_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_397f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_13d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l742_l705_DUPLICATE_76cc_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_cb47 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_cb47;
     VAR_MUX_uxn_opcodes_h_l738_c22_d90b_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_1b3b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_1b3b;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_0d6e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_0d6e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_iffalse := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_e8f8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_e8f8;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_left := t16;
     VAR_MUX_uxn_opcodes_h_l738_c22_d90b_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse := t16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l731_c11_4744] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_left;
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output := BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l726_c7_2119] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_2119_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c26_89b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c6_acda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l738_c22_545a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_left;
     BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_return_output := BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l723_c11_5106] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_left;
     BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output := BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_397f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_397f_return_output := result.sp_relative_shift;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c11_55ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l734_l731_l726_l723_DUPLICATE_1221 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l734_l731_l726_l723_DUPLICATE_1221_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_8060 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_8060_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l736_c30_e9f5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_ins;
     sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_x;
     sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_return_output := sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_a5a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_a5a8_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l734_c11_4de7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_left;
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output := BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_13d9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_13d9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_acda_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_5106_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_55ea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_4744_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_4de7_return_output;
     VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_89b0_return_output;
     VAR_MUX_uxn_opcodes_h_l738_c22_d90b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_545a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_13d9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_13d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_397f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_397f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_397f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_397f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l734_l731_l726_l723_DUPLICATE_1221_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l734_l731_l726_l723_DUPLICATE_1221_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l734_l731_l726_l723_DUPLICATE_1221_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l734_l731_l726_l723_DUPLICATE_1221_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l734_l731_l726_l723_DUPLICATE_1221_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_8060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_8060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_8060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_8060_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_a5a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_a5a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_a5a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_a5a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_7ad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_2119_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_e9f5_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- MUX[uxn_opcodes_h_l737_c26_ad3d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l737_c26_ad3d_cond <= VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_cond;
     MUX_uxn_opcodes_h_l737_c26_ad3d_iftrue <= VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_iftrue;
     MUX_uxn_opcodes_h_l737_c26_ad3d_iffalse <= VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_return_output := MUX_uxn_opcodes_h_l737_c26_ad3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_0300] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_0300] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_return_output;

     -- n8_MUX[uxn_opcodes_h_l734_c7_0300] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l734_c7_0300_cond <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_cond;
     n8_MUX_uxn_opcodes_h_l734_c7_0300_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_iftrue;
     n8_MUX_uxn_opcodes_h_l734_c7_0300_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_return_output := n8_MUX_uxn_opcodes_h_l734_c7_0300_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- MUX[uxn_opcodes_h_l738_c22_d90b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l738_c22_d90b_cond <= VAR_MUX_uxn_opcodes_h_l738_c22_d90b_cond;
     MUX_uxn_opcodes_h_l738_c22_d90b_iftrue <= VAR_MUX_uxn_opcodes_h_l738_c22_d90b_iftrue;
     MUX_uxn_opcodes_h_l738_c22_d90b_iffalse <= VAR_MUX_uxn_opcodes_h_l738_c22_d90b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l738_c22_d90b_return_output := MUX_uxn_opcodes_h_l738_c22_d90b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l732_c3_6689] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_left;
     BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_return_output := BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l728_c3_da9f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_return_output := CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_2119] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_6689_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_da9f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iftrue := VAR_MUX_uxn_opcodes_h_l737_c26_ad3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iftrue := VAR_MUX_uxn_opcodes_h_l738_c22_d90b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse := VAR_n8_MUX_uxn_opcodes_h_l734_c7_0300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_2119_return_output;
     -- n8_MUX[uxn_opcodes_h_l731_c7_5fae] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l731_c7_5fae_cond <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_cond;
     n8_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue;
     n8_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_return_output := n8_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l723_c7_fcd0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_0300] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_5fae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l734_c7_0300] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_cond;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_return_output := result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_return_output;

     -- t16_MUX[uxn_opcodes_h_l731_c7_5fae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l731_c7_5fae_cond <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_cond;
     t16_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue;
     t16_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_return_output := t16_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_5fae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_iffalse := VAR_n8_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0300_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_iffalse := VAR_t16_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_5fae] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;

     -- n8_MUX[uxn_opcodes_h_l726_c7_2119] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l726_c7_2119_cond <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_cond;
     n8_MUX_uxn_opcodes_h_l726_c7_2119_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_iftrue;
     n8_MUX_uxn_opcodes_h_l726_c7_2119_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_return_output := n8_MUX_uxn_opcodes_h_l726_c7_2119_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_2119] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l731_c7_5fae] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_cond;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_return_output := result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- t16_MUX[uxn_opcodes_h_l726_c7_2119] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c7_2119_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_cond;
     t16_MUX_uxn_opcodes_h_l726_c7_2119_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c7_2119_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_return_output := t16_MUX_uxn_opcodes_h_l726_c7_2119_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_2119] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l726_c7_2119_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_2119_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_2119_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_5fae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l726_c7_2119_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l726_c7_2119] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_cond;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_return_output := result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_2119] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l723_c7_fcd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;

     -- t16_MUX[uxn_opcodes_h_l723_c7_fcd0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l723_c7_fcd0_cond <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_cond;
     t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue;
     t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output := t16_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;

     -- n8_MUX[uxn_opcodes_h_l723_c7_fcd0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l723_c7_fcd0_cond <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_cond;
     n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue;
     n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output := n8_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l723_c7_fcd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_2119_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_2119_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l723_c7_fcd0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;

     -- n8_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := n8_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- t16_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := t16_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l723_c7_fcd0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output := result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_fcd0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l710_c2_7ad7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output := result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l742_l705_DUPLICATE_76cc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l742_l705_DUPLICATE_76cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_de89(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_7ad7_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l742_l705_DUPLICATE_76cc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l742_l705_DUPLICATE_76cc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
