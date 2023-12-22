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
-- BIN_OP_EQ[uxn_opcodes_h_l710_c6_3fba]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c2_2c85]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l710_c2_2c85]
signal n8_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l710_c2_2c85]
signal t16_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l723_c11_4106]
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l723_c7_a979]
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l723_c7_a979]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l723_c7_a979]
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l723_c7_a979]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l723_c7_a979]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l723_c7_a979]
signal n8_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l723_c7_a979]
signal t16_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l726_c11_443f]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_02ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_02ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l726_c7_02ee]
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_02ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_02ee]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l726_c7_02ee]
signal n8_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c7_02ee]
signal t16_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l728_c3_1f62]
signal CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l731_c11_6607]
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_500c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l731_c7_500c]
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_500c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_500c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l731_c7_500c]
signal n8_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l731_c7_500c]
signal t16_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l732_c3_80b1]
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l734_c11_a710]
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_0a4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l734_c7_0a4b]
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_0a4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_0a4b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l734_c7_0a4b]
signal n8_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l736_c30_d4d1]
signal sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c26_0f4f]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l737_c26_506d]
signal MUX_uxn_opcodes_h_l737_c26_506d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_506d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_506d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l737_c26_506d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l738_c22_16b5]
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l738_c22_ff41]
signal MUX_uxn_opcodes_h_l738_c22_ff41_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_ff41_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_ff41_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l738_c22_ff41_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fe00( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba
BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85
result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- n8_MUX_uxn_opcodes_h_l710_c2_2c85
n8_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
n8_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
n8_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
n8_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- t16_MUX_uxn_opcodes_h_l710_c2_2c85
t16_MUX_uxn_opcodes_h_l710_c2_2c85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l710_c2_2c85_cond,
t16_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue,
t16_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse,
t16_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106
BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_left,
BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_right,
BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979
result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_cond,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_return_output);

-- n8_MUX_uxn_opcodes_h_l723_c7_a979
n8_MUX_uxn_opcodes_h_l723_c7_a979 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l723_c7_a979_cond,
n8_MUX_uxn_opcodes_h_l723_c7_a979_iftrue,
n8_MUX_uxn_opcodes_h_l723_c7_a979_iffalse,
n8_MUX_uxn_opcodes_h_l723_c7_a979_return_output);

-- t16_MUX_uxn_opcodes_h_l723_c7_a979
t16_MUX_uxn_opcodes_h_l723_c7_a979 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l723_c7_a979_cond,
t16_MUX_uxn_opcodes_h_l723_c7_a979_iftrue,
t16_MUX_uxn_opcodes_h_l723_c7_a979_iffalse,
t16_MUX_uxn_opcodes_h_l723_c7_a979_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f
BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee
result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_cond,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_return_output);

-- n8_MUX_uxn_opcodes_h_l726_c7_02ee
n8_MUX_uxn_opcodes_h_l726_c7_02ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l726_c7_02ee_cond,
n8_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue,
n8_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse,
n8_MUX_uxn_opcodes_h_l726_c7_02ee_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c7_02ee
t16_MUX_uxn_opcodes_h_l726_c7_02ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c7_02ee_cond,
t16_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue,
t16_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse,
t16_MUX_uxn_opcodes_h_l726_c7_02ee_return_output);

-- CONST_SL_8_uxn_opcodes_h_l728_c3_1f62
CONST_SL_8_uxn_opcodes_h_l728_c3_1f62 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_x,
CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607
BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_left,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_right,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c
result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_cond,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_return_output);

-- n8_MUX_uxn_opcodes_h_l731_c7_500c
n8_MUX_uxn_opcodes_h_l731_c7_500c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l731_c7_500c_cond,
n8_MUX_uxn_opcodes_h_l731_c7_500c_iftrue,
n8_MUX_uxn_opcodes_h_l731_c7_500c_iffalse,
n8_MUX_uxn_opcodes_h_l731_c7_500c_return_output);

-- t16_MUX_uxn_opcodes_h_l731_c7_500c
t16_MUX_uxn_opcodes_h_l731_c7_500c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l731_c7_500c_cond,
t16_MUX_uxn_opcodes_h_l731_c7_500c_iftrue,
t16_MUX_uxn_opcodes_h_l731_c7_500c_iffalse,
t16_MUX_uxn_opcodes_h_l731_c7_500c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1
BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_left,
BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_right,
BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710
BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_left,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_right,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_cond,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output);

-- n8_MUX_uxn_opcodes_h_l734_c7_0a4b
n8_MUX_uxn_opcodes_h_l734_c7_0a4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l734_c7_0a4b_cond,
n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue,
n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse,
n8_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1
sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_ins,
sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_x,
sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_y,
sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f
BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_return_output);

-- MUX_uxn_opcodes_h_l737_c26_506d
MUX_uxn_opcodes_h_l737_c26_506d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l737_c26_506d_cond,
MUX_uxn_opcodes_h_l737_c26_506d_iftrue,
MUX_uxn_opcodes_h_l737_c26_506d_iffalse,
MUX_uxn_opcodes_h_l737_c26_506d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5
BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_left,
BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_right,
BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_return_output);

-- MUX_uxn_opcodes_h_l738_c22_ff41
MUX_uxn_opcodes_h_l738_c22_ff41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l738_c22_ff41_cond,
MUX_uxn_opcodes_h_l738_c22_ff41_iftrue,
MUX_uxn_opcodes_h_l738_c22_ff41_iffalse,
MUX_uxn_opcodes_h_l738_c22_ff41_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 n8_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 t16_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_return_output,
 n8_MUX_uxn_opcodes_h_l723_c7_a979_return_output,
 t16_MUX_uxn_opcodes_h_l723_c7_a979_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_return_output,
 n8_MUX_uxn_opcodes_h_l726_c7_02ee_return_output,
 t16_MUX_uxn_opcodes_h_l726_c7_02ee_return_output,
 CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_return_output,
 n8_MUX_uxn_opcodes_h_l731_c7_500c_return_output,
 t16_MUX_uxn_opcodes_h_l731_c7_500c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output,
 n8_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output,
 sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_return_output,
 MUX_uxn_opcodes_h_l737_c26_506d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_return_output,
 MUX_uxn_opcodes_h_l738_c22_ff41_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_7fcb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_5689 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_d6b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_167e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_02ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_506d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_506d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_506d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l737_c26_506d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_ff41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_ff41_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_ff41_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l738_c22_ff41_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l726_l723_l731_l734_DUPLICATE_3f3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_c873_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_6d85_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_427f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_a5ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l742_l705_DUPLICATE_7936_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l738_c22_ff41_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_5689 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l715_c3_5689;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l737_c26_506d_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l737_c26_506d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_167e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_167e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_7fcb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l720_c3_7fcb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_d6b1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l724_c3_d6b1;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_left := t16;
     VAR_MUX_uxn_opcodes_h_l738_c22_ff41_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_iffalse := t16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_2c85_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_6d85 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_6d85_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l734_c11_a710] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_left;
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output := BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_427f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_427f_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_a5ca LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_a5ca_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l738_c22_16b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l723_c11_4106] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_left;
     BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output := BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l726_c7_02ee] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_02ee_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l736_c30_d4d1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_ins;
     sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_x;
     sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_return_output := sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l731_c11_6607] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_left;
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output := BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c11_443f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c6_3fba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l726_l723_l731_l734_DUPLICATE_3f3d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l726_l723_l731_l734_DUPLICATE_3f3d_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c26_0f4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_c873 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_c873_return_output := result.is_opc_done;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c6_3fba_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_4106_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_443f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6607_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_a710_return_output;
     VAR_MUX_uxn_opcodes_h_l737_c26_506d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c26_0f4f_return_output;
     VAR_MUX_uxn_opcodes_h_l738_c22_ff41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l738_c22_16b5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_a5ca_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l727_l732_DUPLICATE_a5ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_6d85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_6d85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_6d85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_6d85_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l726_l723_l731_l734_DUPLICATE_3f3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l726_l723_l731_l734_DUPLICATE_3f3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l726_l723_l731_l734_DUPLICATE_3f3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l726_l723_l731_l734_DUPLICATE_3f3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l726_l723_l731_l734_DUPLICATE_3f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_c873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_c873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_c873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_c873_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_427f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_427f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_427f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l731_l734_l726_l723_DUPLICATE_427f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l710_c2_2c85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l710_c2_2c85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l726_c7_02ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l736_c30_d4d1_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l728_c3_1f62] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_x <= VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_return_output := CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_return_output;

     -- MUX[uxn_opcodes_h_l737_c26_506d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l737_c26_506d_cond <= VAR_MUX_uxn_opcodes_h_l737_c26_506d_cond;
     MUX_uxn_opcodes_h_l737_c26_506d_iftrue <= VAR_MUX_uxn_opcodes_h_l737_c26_506d_iftrue;
     MUX_uxn_opcodes_h_l737_c26_506d_iffalse <= VAR_MUX_uxn_opcodes_h_l737_c26_506d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l737_c26_506d_return_output := MUX_uxn_opcodes_h_l737_c26_506d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- MUX[uxn_opcodes_h_l738_c22_ff41] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l738_c22_ff41_cond <= VAR_MUX_uxn_opcodes_h_l738_c22_ff41_cond;
     MUX_uxn_opcodes_h_l738_c22_ff41_iftrue <= VAR_MUX_uxn_opcodes_h_l738_c22_ff41_iftrue;
     MUX_uxn_opcodes_h_l738_c22_ff41_iffalse <= VAR_MUX_uxn_opcodes_h_l738_c22_ff41_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l738_c22_ff41_return_output := MUX_uxn_opcodes_h_l738_c22_ff41_return_output;

     -- n8_MUX[uxn_opcodes_h_l734_c7_0a4b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l734_c7_0a4b_cond <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_cond;
     n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue;
     n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output := n8_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_02ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_0a4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l732_c3_80b1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_left;
     BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_return_output := BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_0a4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l732_c3_80b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l728_c3_1f62_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue := VAR_MUX_uxn_opcodes_h_l737_c26_506d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue := VAR_MUX_uxn_opcodes_h_l738_c22_ff41_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l723_c7_a979] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_0a4b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_500c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_return_output;

     -- n8_MUX[uxn_opcodes_h_l731_c7_500c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l731_c7_500c_cond <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_cond;
     n8_MUX_uxn_opcodes_h_l731_c7_500c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_iftrue;
     n8_MUX_uxn_opcodes_h_l731_c7_500c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_return_output := n8_MUX_uxn_opcodes_h_l731_c7_500c_return_output;

     -- t16_MUX[uxn_opcodes_h_l731_c7_500c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l731_c7_500c_cond <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_cond;
     t16_MUX_uxn_opcodes_h_l731_c7_500c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_iftrue;
     t16_MUX_uxn_opcodes_h_l731_c7_500c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_return_output := t16_MUX_uxn_opcodes_h_l731_c7_500c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_500c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l734_c7_0a4b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output := result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse := VAR_n8_MUX_uxn_opcodes_h_l731_c7_500c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_500c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_500c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l723_c7_a979_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_0a4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l731_c7_500c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_500c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_02ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l726_c7_02ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c7_02ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_cond;
     t16_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_return_output := t16_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l731_c7_500c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_return_output := result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_02ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l726_c7_02ee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l726_c7_02ee_cond <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_cond;
     n8_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue;
     n8_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_return_output := n8_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_iffalse := VAR_n8_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_500c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_500c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_iffalse := VAR_t16_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l723_c7_a979] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_return_output;

     -- t16_MUX[uxn_opcodes_h_l723_c7_a979] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l723_c7_a979_cond <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_cond;
     t16_MUX_uxn_opcodes_h_l723_c7_a979_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_iftrue;
     t16_MUX_uxn_opcodes_h_l723_c7_a979_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_return_output := t16_MUX_uxn_opcodes_h_l723_c7_a979_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l726_c7_02ee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_return_output := result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l723_c7_a979] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l723_c7_a979_cond <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_cond;
     n8_MUX_uxn_opcodes_h_l723_c7_a979_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_iftrue;
     n8_MUX_uxn_opcodes_h_l723_c7_a979_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_return_output := n8_MUX_uxn_opcodes_h_l723_c7_a979_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_02ee] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l723_c7_a979] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_n8_MUX_uxn_opcodes_h_l723_c7_a979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_a979_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l723_c7_a979_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_02ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_t16_MUX_uxn_opcodes_h_l723_c7_a979_return_output;
     -- n8_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     n8_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     n8_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := n8_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l723_c7_a979] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_cond;
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_return_output := result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l723_c7_a979] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_return_output;

     -- t16_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     t16_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     t16_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := t16_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_a979_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l723_c7_a979_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c2_2c85] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l742_l705_DUPLICATE_7936 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l742_l705_DUPLICATE_7936_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fe00(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l710_c2_2c85_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c2_2c85_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l742_l705_DUPLICATE_7936_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l742_l705_DUPLICATE_7936_return_output;
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
