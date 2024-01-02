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
-- Submodules: 53
entity stz2_0CLK_75b4bee3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_75b4bee3;
architecture arch of stz2_0CLK_75b4bee3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_10cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal t8_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1557_c2_6c95]
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_8714]
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1570_c7_707d]
signal t8_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_707d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_707d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_707d]
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_707d]
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_707d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_707d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1570_c7_707d]
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1570_c7_707d]
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_268a]
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal t8_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1573_c7_2a91]
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_b9c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_0bbd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_0bbd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_0bbd]
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_0bbd]
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_0bbd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1577_c7_0bbd]
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1577_c7_0bbd]
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1579_c30_8af7]
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_4e54]
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_e38e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_e38e]
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_e38e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_e38e]
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1584_c7_e38e]
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_0cb2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_return_output : unsigned(8 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output);

-- t8_MUX_uxn_opcodes_h_l1557_c2_6c95
t8_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
t8_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95
n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95
n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_cond,
n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue,
n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse,
n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_left,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_right,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output);

-- t8_MUX_uxn_opcodes_h_l1570_c7_707d
t8_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
t8_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
t8_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
t8_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1570_c7_707d
n16_high_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1570_c7_707d
n16_low_MUX_uxn_opcodes_h_l1570_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_cond,
n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue,
n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse,
n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_left,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_right,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output);

-- t8_MUX_uxn_opcodes_h_l1573_c7_2a91
t8_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
t8_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91
n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91
n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_cond,
n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue,
n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse,
n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd
n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond,
n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue,
n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse,
n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd
n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond,
n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue,
n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse,
n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7
sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_ins,
sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_x,
sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_y,
sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_left,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_right,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e
n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_cond,
n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue,
n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse,
n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16_low,
 n16_high,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output,
 t8_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output,
 t8_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output,
 t8_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output,
 n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output,
 n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output,
 sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output,
 n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_dbb5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_1799 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_3015 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_093d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_2a91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_487d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_9c18 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_7937_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_c976_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_0ea9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_a5b6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_cd16_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_5422_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1552_l1592_DUPLICATE_c91b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16_low := n16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_1799 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_1799;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_9c18 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_9c18;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_dbb5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_dbb5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_093d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_093d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_3015 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_3015;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l1579_c30_8af7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_ins;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_x;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_return_output := sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_cd16 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_cd16_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1581_c22_487d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_487d_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_8714] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_left;
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output := BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output := result.is_pc_updated;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_0ea9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_0ea9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_b9c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_4e54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_left;
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output := BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_a5b6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_a5b6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_10cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_5422 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_5422_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_c976 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_c976_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_268a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_2a91_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_0cb2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_10cf_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_8714_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_268a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_b9c5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_4e54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_487d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_a5b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_a5b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_a5b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_c976_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_c976_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_c976_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_c976_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_5422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_5422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_5422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_5422_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_cd16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_cd16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_cd16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_0ea9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_0ea9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_0ea9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_0ea9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_6c95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_2a91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_8af7_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1584_c7_e38e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_cond;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output := n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_e38e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- t8_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := t8_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_0bbd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_e38e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_e38e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1587_c22_7937] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_7937_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0cb2_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1577_c7_0bbd] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output := n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_7937_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1577_c7_0bbd] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output := n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_e38e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- t8_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     t8_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     t8_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := t8_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_0bbd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_0bbd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_0bbd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_e38e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_0bbd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- t8_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := t8_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_0bbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_2a91] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output := result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_2a91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_707d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_707d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_6c95] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output := result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1552_l1592_DUPLICATE_c91b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1552_l1592_DUPLICATE_c91b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_6c95_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1552_l1592_DUPLICATE_c91b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1552_l1592_DUPLICATE_c91b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16_low <= REG_COMB_n16_low;
     n16_high <= REG_COMB_n16_high;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
