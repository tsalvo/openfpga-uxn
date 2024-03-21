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
-- Submodules: 61
entity ldr2_0CLK_b7cf2331 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_b7cf2331;
architecture arch of ldr2_0CLK_b7cf2331 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1639_c6_3dcc]
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal t8_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1639_c2_06ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_7e79]
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1652_c7_7832]
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1652_c7_7832]
signal t8_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1652_c7_7832]
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_7832]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_7832]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_7832]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_7832]
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_7832]
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_7832]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1653_c30_4884]
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_1ce9]
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1655_c7_d569]
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1655_c7_d569]
signal t8_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1655_c7_d569]
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_d569]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_d569]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_d569]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1655_c7_d569]
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1655_c7_d569]
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_d569]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1658_c22_94b2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_ddd3]
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1660_c7_ab74]
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1660_c7_ab74]
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_ab74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_ab74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1660_c7_ab74]
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1660_c7_ab74]
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_ab74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_0b84]
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_5e76]
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_cf03]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1663_c7_ecc6]
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1663_c7_ecc6]
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_ecc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_ecc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_ecc6]
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_ecc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_ccc7]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_7628]
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_7628]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_7628]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_7628]
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7557( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_left,
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_right,
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- t8_MUX_uxn_opcodes_h_l1639_c2_06ea
t8_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
t8_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_left,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_right,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- t8_MUX_uxn_opcodes_h_l1652_c7_7832
t8_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
t8_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
t8_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
t8_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1653_c30_4884
sp_relative_shift_uxn_opcodes_h_l1653_c30_4884 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_ins,
sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_x,
sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_y,
sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_left,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_right,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- t8_MUX_uxn_opcodes_h_l1655_c7_d569
t8_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
t8_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
t8_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
t8_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_left,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_right,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_cond,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_cond,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_left,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_right,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_left,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_right,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_cond,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_cond,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8_high,
 tmp8_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 t8_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 t8_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_return_output,
 sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 t8_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_ac8d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_abe0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_0933 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_d569_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1658_c3_db80 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_7a16_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1661_c3_e1de : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_fbd5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_af5a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_4f6a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1639_l1660_l1652_DUPLICATE_1724_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_8acc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1655_l1669_l1660_l1652_DUPLICATE_6fd0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1669_l1663_DUPLICATE_a937_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1655_l1660_l1652_l1663_DUPLICATE_1789_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1635_l1676_DUPLICATE_ef71_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_4f6a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_4f6a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_ac8d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_ac8d;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_0933 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_0933;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_abe0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_abe0;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_af5a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_af5a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_right := to_unsigned(3, 2);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse := tmp8_low;
     -- CAST_TO_int8_t[uxn_opcodes_h_l1658_c27_7a16] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_7a16_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1655_l1660_l1652_l1663_DUPLICATE_1789 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1655_l1660_l1652_l1663_DUPLICATE_1789_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1655_l1669_l1660_l1652_DUPLICATE_6fd0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1655_l1669_l1660_l1652_DUPLICATE_6fd0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1639_c6_3dcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_ddd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_7e79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_left;
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output := BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1639_l1660_l1652_DUPLICATE_1724 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1639_l1660_l1652_DUPLICATE_1724_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1669_l1663_DUPLICATE_a937 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1669_l1663_DUPLICATE_a937_return_output := result.is_opc_done;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1661_c27_fbd5] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_fbd5_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_1ce9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1653_c30_4884] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_ins;
     sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_x;
     sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_return_output := sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_cf03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_ccc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_d569_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_8acc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_8acc_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_3dcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_7e79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_1ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ddd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_cf03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_ccc7_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_7a16_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_fbd5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1639_l1660_l1652_DUPLICATE_1724_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1639_l1660_l1652_DUPLICATE_1724_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1639_l1660_l1652_DUPLICATE_1724_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1669_l1663_DUPLICATE_a937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1669_l1663_DUPLICATE_a937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1669_l1663_DUPLICATE_a937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1669_l1663_DUPLICATE_a937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1669_l1663_DUPLICATE_a937_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1655_l1660_l1652_l1663_DUPLICATE_1789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1655_l1660_l1652_l1663_DUPLICATE_1789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1655_l1660_l1652_l1663_DUPLICATE_1789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1655_l1660_l1652_l1663_DUPLICATE_1789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1655_l1669_l1660_l1652_DUPLICATE_6fd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1655_l1669_l1660_l1652_DUPLICATE_6fd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1655_l1669_l1660_l1652_DUPLICATE_6fd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1655_l1669_l1660_l1652_DUPLICATE_6fd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_8acc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_8acc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_8acc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_8acc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_8acc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_06ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_4884_return_output;
     -- t8_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     t8_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     t8_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := t8_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_ecc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_7628] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_0b84] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_7628] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_return_output := tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_7628] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_return_output := result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1658_c22_94b2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_7628] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1663_c7_ecc6] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output := tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1658_c3_db80 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_94b2_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0b84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_7628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_7628_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_7628_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_7628_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1658_c3_db80;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_5e76] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_ab74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1660_c7_ab74] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output := tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_ecc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_ecc6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_ecc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     t8_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     t8_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := t8_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1663_c7_ecc6] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output := tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1661_c3_e1de := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5e76_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_ecc6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1661_c3_e1de;
     -- result_u16_value_MUX[uxn_opcodes_h_l1660_c7_ab74] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output := result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1660_c7_ab74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output := result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1660_c7_ab74] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output := tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- t8_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := t8_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_ab74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_ab74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_ab74_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1655_c7_d569] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output := result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_d569_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_7832] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output := result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_7832_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1639_c2_06ea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output := result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1635_l1676_DUPLICATE_ef71 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1635_l1676_DUPLICATE_ef71_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_06ea_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1635_l1676_DUPLICATE_ef71_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1635_l1676_DUPLICATE_ef71_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
