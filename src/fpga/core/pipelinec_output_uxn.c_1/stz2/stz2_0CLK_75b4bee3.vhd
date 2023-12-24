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
-- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_ac86]
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1557_c2_0ccf]
signal t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_4d09]
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1570_c7_aa31]
signal t8_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_23b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1573_c7_548d]
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1573_c7_548d]
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_548d]
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_548d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_548d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_548d]
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_548d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_548d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1573_c7_548d]
signal t8_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_fd54]
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1577_c7_ff35]
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1577_c7_ff35]
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_ff35]
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_ff35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_ff35]
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_ff35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_ff35]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1579_c30_21f2]
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_3d91]
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1584_c7_df17]
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_df17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_df17]
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_df17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_df17]
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_0c92]
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e482( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_left,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_right,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf
n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf
n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- t8_MUX_uxn_opcodes_h_l1557_c2_0ccf
t8_MUX_uxn_opcodes_h_l1557_c2_0ccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond,
t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue,
t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse,
t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_left,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_right,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31
n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31
n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- t8_MUX_uxn_opcodes_h_l1570_c7_aa31
t8_MUX_uxn_opcodes_h_l1570_c7_aa31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1570_c7_aa31_cond,
t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue,
t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse,
t8_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1573_c7_548d
n16_low_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1573_c7_548d
n16_high_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- t8_MUX_uxn_opcodes_h_l1573_c7_548d
t8_MUX_uxn_opcodes_h_l1573_c7_548d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1573_c7_548d_cond,
t8_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue,
t8_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse,
t8_MUX_uxn_opcodes_h_l1573_c7_548d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_left,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_right,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35
n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_cond,
n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue,
n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse,
n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35
n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_cond,
n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue,
n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse,
n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2
sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_ins,
sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_x,
sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_y,
sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_left,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_right,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1584_c7_df17
n16_low_MUX_uxn_opcodes_h_l1584_c7_df17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_cond,
n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue,
n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse,
n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_left,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_right,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output,
 n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output,
 n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 t8_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output,
 n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 t8_MUX_uxn_opcodes_h_l1573_c7_548d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output,
 n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output,
 n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output,
 sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output,
 n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_e09e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_c16b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_16f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_23c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_548d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_2414_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_de44 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_ab9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7f9d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_729b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_72f1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_7c06_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_b3c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1592_l1552_DUPLICATE_4c6c_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_de44 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_de44;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_e09e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_e09e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_16f6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_16f6;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_c16b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_c16b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_23c6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_23c6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := t8;
     -- CAST_TO_uint16_t[uxn_opcodes_h_l1581_c22_2414] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_2414_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_548d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_fd54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_left;
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output := BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_0c92] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_3d91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_left;
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output := BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_23b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_b3c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_b3c1_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_72f1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_72f1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_7c06 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_7c06_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_ac86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_left;
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output := BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_729b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_729b_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7f9d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7f9d_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1579_c30_21f2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_ins;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_x;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_return_output := sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_4d09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_ac86_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_4d09_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_23b7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_fd54_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_3d91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_2414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_72f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_72f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_72f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_729b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_729b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_729b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_729b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_7c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_7c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_7c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_7c06_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_b3c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_b3c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_b3c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7f9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7f9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7f9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_7f9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_0ccf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_548d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_21f2_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_ff35] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1584_c7_df17] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_cond;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_return_output := n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_df17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_df17] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output := result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;

     -- t8_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     t8_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     t8_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := t8_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1577_c7_ff35] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_cond;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output := n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_df17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1587_c22_ab9c] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_ab9c_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_0c92_return_output);

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_ab9c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_df17] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output := result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;

     -- t8_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := t8_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_ff35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1577_c7_ff35] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_cond;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output := n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_ff35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output := result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_ff35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_df17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_ff35] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output := result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_ff35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_548d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_548d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_aa31] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output := result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_aa31_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_0ccf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1592_l1552_DUPLICATE_4c6c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1592_l1552_DUPLICATE_4c6c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e482(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_0ccf_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1592_l1552_DUPLICATE_4c6c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1592_l1552_DUPLICATE_4c6c_return_output;
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
