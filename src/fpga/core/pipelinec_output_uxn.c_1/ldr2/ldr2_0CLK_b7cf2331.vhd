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
-- BIN_OP_EQ[uxn_opcodes_h_l1639_c6_6eba]
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1639_c2_d391]
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1639_c2_d391]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1639_c2_d391]
signal t8_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1639_c2_d391]
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_dfc2]
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1652_c7_ee7d]
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1653_c30_52b4]
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_a10b]
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal t8_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1655_c7_df7c]
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1658_c22_c34b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_eef7]
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1660_c7_2616]
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1660_c7_2616]
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_2616]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_2616]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1660_c7_2616]
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_2616]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1660_c7_2616]
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_0211]
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_81d4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_8197]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1663_c7_bae2]
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_bae2]
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_bae2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_bae2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_bae2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1663_c7_bae2]
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_eab8]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_59b2]
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_59b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_59b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_59b2]
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_18d4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_left,
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_right,
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- t8_MUX_uxn_opcodes_h_l1639_c2_d391
t8_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
t8_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
t8_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
t8_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_cond,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_left,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_right,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- t8_MUX_uxn_opcodes_h_l1652_c7_ee7d
t8_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4
sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_ins,
sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_x,
sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_y,
sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_left,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_right,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- t8_MUX_uxn_opcodes_h_l1655_c7_df7c
t8_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
t8_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_cond,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_left,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_right,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_cond,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_cond,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_left,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_right,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_cond,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_cond,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_cond,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 t8_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 t8_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_be49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_103a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1658_c3_52ae : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_598f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_df7c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_83fa_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1661_c3_3779 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_b65f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_a845 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_08a6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1669_l1660_l1655_l1652_l1639_DUPLICATE_bc3d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1652_l1639_l1660_DUPLICATE_e161_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1663_l1655_l1660_DUPLICATE_181d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1652_l1655_l1669_l1660_DUPLICATE_4565_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1669_l1663_l1660_l1655_l1652_DUPLICATE_35c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1676_l1635_DUPLICATE_540c_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_a845 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_a845;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_be49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_be49;
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_08a6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_08a6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_598f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_598f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_103a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_103a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse := tmp8_low;
     -- CAST_TO_int8_t[uxn_opcodes_h_l1658_c27_83fa] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_83fa_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_eab8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1652_l1655_l1669_l1660_DUPLICATE_4565 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1652_l1655_l1669_l1660_DUPLICATE_4565_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1669_l1663_l1660_l1655_l1652_DUPLICATE_35c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1669_l1663_l1660_l1655_l1652_DUPLICATE_35c9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_8197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1653_c30_52b4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_ins;
     sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_x;
     sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_return_output := sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_d391_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_dfc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1663_l1655_l1660_DUPLICATE_181d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1663_l1655_l1660_DUPLICATE_181d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1639_c6_6eba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_df7c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_eef7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_a10b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1669_l1660_l1655_l1652_l1639_DUPLICATE_bc3d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1669_l1660_l1655_l1652_l1639_DUPLICATE_bc3d_return_output := result.u8_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1661_c27_b65f] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_b65f_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_d391_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_d391_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1652_l1639_l1660_DUPLICATE_e161 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1652_l1639_l1660_DUPLICATE_e161_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_d391_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_6eba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dfc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_a10b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_eef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_8197_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_eab8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_83fa_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_b65f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1652_l1639_l1660_DUPLICATE_e161_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1652_l1639_l1660_DUPLICATE_e161_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1652_l1639_l1660_DUPLICATE_e161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1669_l1663_l1660_l1655_l1652_DUPLICATE_35c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1669_l1663_l1660_l1655_l1652_DUPLICATE_35c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1669_l1663_l1660_l1655_l1652_DUPLICATE_35c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1669_l1663_l1660_l1655_l1652_DUPLICATE_35c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1669_l1663_l1660_l1655_l1652_DUPLICATE_35c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1663_l1655_l1660_DUPLICATE_181d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1663_l1655_l1660_DUPLICATE_181d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1663_l1655_l1660_DUPLICATE_181d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1663_l1655_l1660_DUPLICATE_181d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1652_l1655_l1669_l1660_DUPLICATE_4565_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1652_l1655_l1669_l1660_DUPLICATE_4565_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1652_l1655_l1669_l1660_DUPLICATE_4565_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1652_l1655_l1669_l1660_DUPLICATE_4565_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1669_l1660_l1655_l1652_l1639_DUPLICATE_bc3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1669_l1660_l1655_l1652_l1639_DUPLICATE_bc3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1669_l1660_l1655_l1652_l1639_DUPLICATE_bc3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1669_l1660_l1655_l1652_l1639_DUPLICATE_bc3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1669_l1660_l1655_l1652_l1639_DUPLICATE_bc3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_d391_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_d391_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_d391_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_d391_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_52b4_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_0211] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_59b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_59b2] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output := tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_59b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1663_c7_bae2] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output := tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_59b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_bae2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := t8_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1658_c22_c34b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1658_c3_52ae := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_c34b_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_0211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_59b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1658_c3_52ae;
     -- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_bae2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_81d4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1660_c7_2616] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_return_output := tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_bae2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_bae2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_2616] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1663_c7_bae2] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output := tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1661_c3_3779 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_81d4_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_bae2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1661_c3_3779;
     -- result_u8_value_MUX[uxn_opcodes_h_l1660_c7_2616] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output := result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1660_c7_2616] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_return_output := tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_2616] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;

     -- t8_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     t8_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     t8_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := t8_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_2616] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1660_c7_2616] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output := result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_2616_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1655_c7_df7c] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output := tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_df7c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_ee7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_ee7d_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1639_c2_d391] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_d391_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1676_l1635_DUPLICATE_540c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1676_l1635_DUPLICATE_540c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_18d4(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_d391_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_d391_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1676_l1635_DUPLICATE_540c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1676_l1635_DUPLICATE_540c_return_output;
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
