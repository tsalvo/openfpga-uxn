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
-- BIN_OP_EQ[uxn_opcodes_h_l710_c6_6826]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l710_c2_a83a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l710_c2_a83a]
signal n8_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l710_c2_a83a]
signal t16_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l723_c11_0281]
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l723_c7_c868]
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l723_c7_c868]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l723_c7_c868]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l723_c7_c868]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l723_c7_c868]
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l723_c7_c868]
signal n8_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l723_c7_c868]
signal t16_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l726_c11_bd51]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l726_c7_1ca2]
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_1ca2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_1ca2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_1ca2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_1ca2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l726_c7_1ca2]
signal n8_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c7_1ca2]
signal t16_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l728_c3_209f]
signal CONST_SL_8_uxn_opcodes_h_l728_c3_209f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l728_c3_209f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l731_c11_0859]
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l731_c7_3c38]
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_3c38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_3c38]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_3c38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l731_c7_3c38]
signal n8_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l731_c7_3c38]
signal t16_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l732_c3_a632]
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l734_c11_9f24]
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l734_c7_c303]
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_c303]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_c303]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_c303]
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l734_c7_c303]
signal n8_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_c303_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l736_c30_2eac]
signal sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c26_ab92]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l737_c26_c46e]
signal MUX_uxn_opcodes_h_l737_c26_c46e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_c46e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_c46e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_c46e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l738_c22_3302]
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l738_c22_8157]
signal MUX_uxn_opcodes_h_l738_c22_8157_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_8157_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_8157_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_8157_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cbec( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826
BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a
result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- n8_MUX_uxn_opcodes_h_l710_c2_a83a
n8_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
n8_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
n8_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
n8_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- t16_MUX_uxn_opcodes_h_l710_c2_a83a
t16_MUX_uxn_opcodes_h_l710_c2_a83a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l710_c2_a83a_cond,
t16_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue,
t16_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse,
t16_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281
BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_left,
BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_right,
BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868
result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_cond,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_return_output);

-- n8_MUX_uxn_opcodes_h_l723_c7_c868
n8_MUX_uxn_opcodes_h_l723_c7_c868 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l723_c7_c868_cond,
n8_MUX_uxn_opcodes_h_l723_c7_c868_iftrue,
n8_MUX_uxn_opcodes_h_l723_c7_c868_iffalse,
n8_MUX_uxn_opcodes_h_l723_c7_c868_return_output);

-- t16_MUX_uxn_opcodes_h_l723_c7_c868
t16_MUX_uxn_opcodes_h_l723_c7_c868 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l723_c7_c868_cond,
t16_MUX_uxn_opcodes_h_l723_c7_c868_iftrue,
t16_MUX_uxn_opcodes_h_l723_c7_c868_iffalse,
t16_MUX_uxn_opcodes_h_l723_c7_c868_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51
BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2
result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_cond,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output);

-- n8_MUX_uxn_opcodes_h_l726_c7_1ca2
n8_MUX_uxn_opcodes_h_l726_c7_1ca2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l726_c7_1ca2_cond,
n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue,
n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse,
n8_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c7_1ca2
t16_MUX_uxn_opcodes_h_l726_c7_1ca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c7_1ca2_cond,
t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue,
t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse,
t16_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l728_c3_209f
CONST_SL_8_uxn_opcodes_h_l728_c3_209f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l728_c3_209f_x,
CONST_SL_8_uxn_opcodes_h_l728_c3_209f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859
BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_left,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_right,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38
result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_cond,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_return_output);

-- n8_MUX_uxn_opcodes_h_l731_c7_3c38
n8_MUX_uxn_opcodes_h_l731_c7_3c38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l731_c7_3c38_cond,
n8_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue,
n8_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse,
n8_MUX_uxn_opcodes_h_l731_c7_3c38_return_output);

-- t16_MUX_uxn_opcodes_h_l731_c7_3c38
t16_MUX_uxn_opcodes_h_l731_c7_3c38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l731_c7_3c38_cond,
t16_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue,
t16_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse,
t16_MUX_uxn_opcodes_h_l731_c7_3c38_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l732_c3_a632
BIN_OP_OR_uxn_opcodes_h_l732_c3_a632 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_left,
BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_right,
BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24
BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_left,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_right,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303
result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_cond,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_return_output);

-- n8_MUX_uxn_opcodes_h_l734_c7_c303
n8_MUX_uxn_opcodes_h_l734_c7_c303 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l734_c7_c303_cond,
n8_MUX_uxn_opcodes_h_l734_c7_c303_iftrue,
n8_MUX_uxn_opcodes_h_l734_c7_c303_iffalse,
n8_MUX_uxn_opcodes_h_l734_c7_c303_return_output);

-- sp_relative_shift_uxn_opcodes_h_l736_c30_2eac
sp_relative_shift_uxn_opcodes_h_l736_c30_2eac : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_ins,
sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_x,
sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_y,
sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92
BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_return_output);

-- MUX_uxn_opcodes_h_l737_c26_c46e
MUX_uxn_opcodes_h_l737_c26_c46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l737_c26_c46e_cond,
MUX_uxn_opcodes_h_l737_c26_c46e_iftrue,
MUX_uxn_opcodes_h_l737_c26_c46e_iffalse,
MUX_uxn_opcodes_h_l737_c26_c46e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302
BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_left,
BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_right,
BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_return_output);

-- MUX_uxn_opcodes_h_l738_c22_8157
MUX_uxn_opcodes_h_l738_c22_8157 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l738_c22_8157_cond,
MUX_uxn_opcodes_h_l738_c22_8157_iftrue,
MUX_uxn_opcodes_h_l738_c22_8157_iffalse,
MUX_uxn_opcodes_h_l738_c22_8157_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 n8_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 t16_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_return_output,
 n8_MUX_uxn_opcodes_h_l723_c7_c868_return_output,
 t16_MUX_uxn_opcodes_h_l723_c7_c868_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output,
 n8_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output,
 t16_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output,
 CONST_SL_8_uxn_opcodes_h_l728_c3_209f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_return_output,
 n8_MUX_uxn_opcodes_h_l731_c7_3c38_return_output,
 t16_MUX_uxn_opcodes_h_l731_c7_3c38_return_output,
 BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_return_output,
 n8_MUX_uxn_opcodes_h_l734_c7_c303_return_output,
 sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_return_output,
 MUX_uxn_opcodes_h_l737_c26_c46e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_return_output,
 MUX_uxn_opcodes_h_l738_c22_8157_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_b297 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_1832 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_0afd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_7e60 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_1ca2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_209f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_209f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_c46e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_c46e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_c46e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_c46e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_8157_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_8157_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_8157_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_8157_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l723_l710_l734_l731_DUPLICATE_4607_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_b306_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_47ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_220f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_e70f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l742_l705_DUPLICATE_5ddc_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l737_c26_c46e_iffalse := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_b297 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_b297;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_7e60 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_7e60;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l738_c22_8157_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l737_c26_c46e_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_1832 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_1832;
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_0afd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_0afd;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_left := t16;
     VAR_MUX_uxn_opcodes_h_l738_c22_8157_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_b306 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_b306_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l731_c11_0859] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_left;
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output := BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_47ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_47ab_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l736_c30_2eac] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_ins;
     sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_x <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_x;
     sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_y <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_return_output := sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_e70f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_e70f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l723_c11_0281] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_left;
     BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output := BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l734_c11_9f24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_left;
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output := BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_a83a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c6_6826] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l738_c22_3302] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_left;
     BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_return_output := BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_220f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_220f_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l726_c7_1ca2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_1ca2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l723_l710_l734_l731_DUPLICATE_4607 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l723_l710_l734_l731_DUPLICATE_4607_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c11_bd51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c26_ab92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_6826_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_0281_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_bd51_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_0859_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_9f24_return_output;
     VAR_MUX_uxn_opcodes_h_l737_c26_c46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_ab92_return_output;
     VAR_MUX_uxn_opcodes_h_l738_c22_8157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_3302_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_e70f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_209f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_e70f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_b306_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_b306_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_b306_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_b306_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l723_l710_l734_l731_DUPLICATE_4607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l723_l710_l734_l731_DUPLICATE_4607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l723_l710_l734_l731_DUPLICATE_4607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l723_l710_l734_l731_DUPLICATE_4607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l723_l710_l734_l731_DUPLICATE_4607_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_220f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_220f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_220f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_220f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_47ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_47ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_47ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l726_l731_l723_l734_DUPLICATE_47ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_a83a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_a83a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_1ca2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_2eac_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- MUX[uxn_opcodes_h_l738_c22_8157] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l738_c22_8157_cond <= VAR_MUX_uxn_opcodes_h_l738_c22_8157_cond;
     MUX_uxn_opcodes_h_l738_c22_8157_iftrue <= VAR_MUX_uxn_opcodes_h_l738_c22_8157_iftrue;
     MUX_uxn_opcodes_h_l738_c22_8157_iffalse <= VAR_MUX_uxn_opcodes_h_l738_c22_8157_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l738_c22_8157_return_output := MUX_uxn_opcodes_h_l738_c22_8157_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_1ca2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l728_c3_209f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l728_c3_209f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_209f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_209f_return_output := CONST_SL_8_uxn_opcodes_h_l728_c3_209f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_c303] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_return_output;

     -- n8_MUX[uxn_opcodes_h_l734_c7_c303] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l734_c7_c303_cond <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_cond;
     n8_MUX_uxn_opcodes_h_l734_c7_c303_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_iftrue;
     n8_MUX_uxn_opcodes_h_l734_c7_c303_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_return_output := n8_MUX_uxn_opcodes_h_l734_c7_c303_return_output;

     -- MUX[uxn_opcodes_h_l737_c26_c46e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l737_c26_c46e_cond <= VAR_MUX_uxn_opcodes_h_l737_c26_c46e_cond;
     MUX_uxn_opcodes_h_l737_c26_c46e_iftrue <= VAR_MUX_uxn_opcodes_h_l737_c26_c46e_iftrue;
     MUX_uxn_opcodes_h_l737_c26_c46e_iffalse <= VAR_MUX_uxn_opcodes_h_l737_c26_c46e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l737_c26_c46e_return_output := MUX_uxn_opcodes_h_l737_c26_c46e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_c303] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l732_c3_a632] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_left;
     BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_return_output := BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_a632_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_209f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iftrue := VAR_MUX_uxn_opcodes_h_l737_c26_c46e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iftrue := VAR_MUX_uxn_opcodes_h_l738_c22_8157_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse := VAR_n8_MUX_uxn_opcodes_h_l734_c7_c303_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_c303_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_c303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_c303] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_return_output;

     -- n8_MUX[uxn_opcodes_h_l731_c7_3c38] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l731_c7_3c38_cond <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_cond;
     n8_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue;
     n8_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_return_output := n8_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;

     -- t16_MUX[uxn_opcodes_h_l731_c7_3c38] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l731_c7_3c38_cond <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_cond;
     t16_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue;
     t16_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_return_output := t16_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l734_c7_c303] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_cond;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_return_output := result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_3c38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l723_c7_c868] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_3c38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_c303_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_c868_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_c303_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;
     -- t16_MUX[uxn_opcodes_h_l726_c7_1ca2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c7_1ca2_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_cond;
     t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output := t16_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_1ca2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l731_c7_3c38] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_cond;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_return_output := result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_1ca2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_3c38] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;

     -- n8_MUX[uxn_opcodes_h_l726_c7_1ca2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l726_c7_1ca2_cond <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_cond;
     n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue;
     n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output := n8_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_iffalse := VAR_n8_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_3c38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_iffalse := VAR_t16_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_1ca2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l723_c7_c868] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_return_output;

     -- t16_MUX[uxn_opcodes_h_l723_c7_c868] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l723_c7_c868_cond <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_cond;
     t16_MUX_uxn_opcodes_h_l723_c7_c868_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_iftrue;
     t16_MUX_uxn_opcodes_h_l723_c7_c868_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_return_output := t16_MUX_uxn_opcodes_h_l723_c7_c868_return_output;

     -- n8_MUX[uxn_opcodes_h_l723_c7_c868] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l723_c7_c868_cond <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_cond;
     n8_MUX_uxn_opcodes_h_l723_c7_c868_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_iftrue;
     n8_MUX_uxn_opcodes_h_l723_c7_c868_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_return_output := n8_MUX_uxn_opcodes_h_l723_c7_c868_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l726_c7_1ca2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output := result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l723_c7_c868] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l723_c7_c868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_c868_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_c868_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_1ca2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l723_c7_c868_return_output;
     -- n8_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     n8_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     n8_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := n8_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l723_c7_c868] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_return_output;

     -- t16_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     t16_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     t16_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := t16_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l723_c7_c868] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_cond;
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_return_output := result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_c868_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_c868_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c2_a83a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l742_l705_DUPLICATE_5ddc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l742_l705_DUPLICATE_5ddc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cbec(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_a83a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_a83a_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l742_l705_DUPLICATE_5ddc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l742_l705_DUPLICATE_5ddc_return_output;
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
