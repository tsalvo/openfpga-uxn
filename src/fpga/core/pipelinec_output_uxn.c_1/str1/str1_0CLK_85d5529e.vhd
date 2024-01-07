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
-- BIN_OP_EQ[uxn_opcodes_h_l1682_c6_01d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal n8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1682_c2_62eb]
signal t8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_b296]
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_4a90]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1695_c7_4a90]
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1695_c7_4a90]
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_4a90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_4a90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_4a90]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1695_c7_4a90]
signal n8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1695_c7_4a90]
signal t8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_375c]
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_dd98]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1698_c7_dd98]
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1698_c7_dd98]
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_dd98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1698_c7_dd98]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1698_c7_dd98]
signal n8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1698_c7_dd98]
signal t8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1701_c11_e64d]
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1701_c7_8c95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1701_c7_8c95]
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1701_c7_8c95]
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1701_c7_8c95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1701_c7_8c95]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1701_c7_8c95]
signal n8_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1703_c30_0800]
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1705_c22_310c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- n8_MUX_uxn_opcodes_h_l1682_c2_62eb
n8_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
n8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- t8_MUX_uxn_opcodes_h_l1682_c2_62eb
t8_MUX_uxn_opcodes_h_l1682_c2_62eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond,
t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue,
t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse,
t8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_left,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_right,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output);

-- n8_MUX_uxn_opcodes_h_l1695_c7_4a90
n8_MUX_uxn_opcodes_h_l1695_c7_4a90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond,
n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue,
n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse,
n8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output);

-- t8_MUX_uxn_opcodes_h_l1695_c7_4a90
t8_MUX_uxn_opcodes_h_l1695_c7_4a90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond,
t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue,
t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse,
t8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_left,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_right,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output);

-- n8_MUX_uxn_opcodes_h_l1698_c7_dd98
n8_MUX_uxn_opcodes_h_l1698_c7_dd98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond,
n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue,
n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse,
n8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output);

-- t8_MUX_uxn_opcodes_h_l1698_c7_dd98
t8_MUX_uxn_opcodes_h_l1698_c7_dd98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond,
t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue,
t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse,
t8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_left,
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_right,
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output);

-- n8_MUX_uxn_opcodes_h_l1701_c7_8c95
n8_MUX_uxn_opcodes_h_l1701_c7_8c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1701_c7_8c95_cond,
n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue,
n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse,
n8_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1703_c30_0800
sp_relative_shift_uxn_opcodes_h_l1703_c30_0800 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_ins,
sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_x,
sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_y,
sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 n8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 t8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output,
 n8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output,
 t8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output,
 n8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output,
 t8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output,
 n8_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output,
 sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_64ee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_c4b9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_8e90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_4a90_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1705_c3_bb8a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_6205_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_e9c8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_7248_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_1d7a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_dccf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_c39b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1710_l1678_DUPLICATE_61a2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_c4b9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_c4b9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_64ee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_64ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_8e90 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_8e90;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse := t8;
     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_b296] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_left;
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output := BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1705_c27_6205] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_6205_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c6_01d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_375c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_7248 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_7248_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_dccf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_dccf_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_4a90_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_1d7a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_1d7a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_c39b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_c39b_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1701_c11_e64d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1703_c30_0800] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_ins;
     sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_x;
     sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_return_output := sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_e9c8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_e9c8_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_01d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_b296_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_375c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_e64d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_6205_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_1d7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_1d7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_1d7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_7248_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_7248_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_7248_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_7248_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_dccf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_dccf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_dccf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_c39b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_c39b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1701_l1695_l1698_DUPLICATE_c39b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_e9c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_e9c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_e9c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1682_l1701_l1695_l1698_DUPLICATE_e9c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_62eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_4a90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_0800_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;

     -- n8_MUX[uxn_opcodes_h_l1701_c7_8c95] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1701_c7_8c95_cond <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_cond;
     n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue;
     n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output := n8_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1701_c7_8c95] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1701_c7_8c95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1705_c22_310c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1701_c7_8c95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- t8_MUX[uxn_opcodes_h_l1698_c7_dd98] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond;
     t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue;
     t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output := t8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1701_c7_8c95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output := result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1705_c3_bb8a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_310c_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1705_c3_bb8a;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_dd98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1698_c7_dd98] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output := result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1698_c7_dd98] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;

     -- t8_MUX[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond;
     t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue;
     t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output := t8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_dd98] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1701_c7_8c95] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output := result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1698_c7_dd98] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_cond;
     n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue;
     n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output := n8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_8c95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1698_c7_dd98] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output := result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;

     -- n8_MUX[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_cond;
     n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue;
     n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output := n8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output := result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;

     -- t8_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := t8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_dd98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1695_c7_4a90] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output := result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;

     -- n8_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := n8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_4a90_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1682_c2_62eb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1710_l1678_DUPLICATE_61a2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1710_l1678_DUPLICATE_61a2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_62eb_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1710_l1678_DUPLICATE_61a2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1710_l1678_DUPLICATE_61a2_return_output;
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
