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
-- Submodules: 41
entity str1_0CLK_85d5529e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_85d5529e;
architecture arch of str1_0CLK_85d5529e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1699_c6_45f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal t8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal n8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c2_62b3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1712_c11_4e64]
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1712_c7_4cf3]
signal t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1712_c7_4cf3]
signal n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1712_c7_4cf3]
signal result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1712_c7_4cf3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1712_c7_4cf3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1712_c7_4cf3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1712_c7_4cf3]
signal result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1712_c7_4cf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1715_c11_a9ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1715_c7_122d]
signal t8_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1715_c7_122d]
signal n8_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1715_c7_122d]
signal result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1715_c7_122d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1715_c7_122d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1715_c7_122d]
signal result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1715_c7_122d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1718_c11_eb15]
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1718_c7_810f]
signal n8_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1718_c7_810f]
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c7_810f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c7_810f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1718_c7_810f]
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c7_810f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1720_c30_175f]
signal sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1722_c22_2189]
signal BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7
BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output);

-- t8_MUX_uxn_opcodes_h_l1699_c2_62b3
t8_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
t8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- n8_MUX_uxn_opcodes_h_l1699_c2_62b3
n8_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
n8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_left,
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_right,
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output);

-- t8_MUX_uxn_opcodes_h_l1712_c7_4cf3
t8_MUX_uxn_opcodes_h_l1712_c7_4cf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond,
t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue,
t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse,
t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output);

-- n8_MUX_uxn_opcodes_h_l1712_c7_4cf3
n8_MUX_uxn_opcodes_h_l1712_c7_4cf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond,
n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue,
n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse,
n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output);

-- t8_MUX_uxn_opcodes_h_l1715_c7_122d
t8_MUX_uxn_opcodes_h_l1715_c7_122d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1715_c7_122d_cond,
t8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue,
t8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse,
t8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output);

-- n8_MUX_uxn_opcodes_h_l1715_c7_122d
n8_MUX_uxn_opcodes_h_l1715_c7_122d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1715_c7_122d_cond,
n8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue,
n8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse,
n8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15
BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_left,
BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_right,
BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output);

-- n8_MUX_uxn_opcodes_h_l1718_c7_810f
n8_MUX_uxn_opcodes_h_l1718_c7_810f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1718_c7_810f_cond,
n8_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue,
n8_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse,
n8_MUX_uxn_opcodes_h_l1718_c7_810f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1720_c30_175f
sp_relative_shift_uxn_opcodes_h_l1720_c30_175f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_ins,
sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_x,
sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_y,
sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189
BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_left,
BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_right,
BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_return_output);



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
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output,
 t8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 n8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output,
 t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output,
 n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output,
 t8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output,
 n8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output,
 n8_MUX_uxn_opcodes_h_l1718_c7_810f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1704_c3_8d34 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1709_c3_d0c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1713_c3_beae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1712_c7_4cf3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1722_c3_40f2 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1722_c27_71d9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_2f14_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_f1f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_0414_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_4eb7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_721d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1727_l1695_DUPLICATE_8d60_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1709_c3_d0c3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1709_c3_d0c3;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1713_c3_beae := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1713_c3_beae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1704_c3_8d34 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1704_c3_8d34;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_4eb7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_4eb7_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1720_c30_175f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_ins;
     sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_x;
     sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_return_output := sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1712_c7_4cf3_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_721d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_721d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_0414 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_0414_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_f1f4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_f1f4_return_output := result.u16_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1722_c27_71d9] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1722_c27_71d9_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1712_c11_4e64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c6_45f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1718_c11_eb15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1715_c11_a9ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_2f14 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_2f14_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c6_45f7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_4e64_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1715_c11_a9ff_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c11_eb15_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1722_c27_71d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_4eb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_4eb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_4eb7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_f1f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_f1f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_f1f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_f1f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_721d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_721d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_721d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_0414_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_0414_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1715_l1718_l1712_DUPLICATE_0414_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_2f14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_2f14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_2f14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1715_l1699_l1718_l1712_DUPLICATE_2f14_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1699_c2_62b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1720_c30_175f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c7_810f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c7_810f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1718_c7_810f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1722_c22_2189] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_return_output;

     -- n8_MUX[uxn_opcodes_h_l1718_c7_810f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1718_c7_810f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_cond;
     n8_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue;
     n8_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_return_output := n8_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1715_c7_122d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1715_c7_122d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_cond;
     t8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue;
     t8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output := t8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c7_810f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1722_c3_40f2 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1722_c22_2189_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1722_c3_40f2;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1715_c7_122d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1715_c7_122d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1715_c7_122d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1715_c7_122d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_cond;
     n8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue;
     n8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output := n8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1715_c7_122d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1715_c7_122d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1718_c7_810f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond;
     t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue;
     t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output := t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c7_810f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond;
     n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue;
     n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output := n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1715_c7_122d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := t8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1715_c7_122d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1712_c7_4cf3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := n8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1712_c7_4cf3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1699_c2_62b3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1727_l1695_DUPLICATE_8d60 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1727_l1695_DUPLICATE_8d60_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c2_62b3_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1727_l1695_DUPLICATE_8d60_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1727_l1695_DUPLICATE_8d60_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
