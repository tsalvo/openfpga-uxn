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
-- BIN_OP_EQ[uxn_opcodes_h_l1558_c6_d581]
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c2_bdc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1571_c11_1040]
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal t8_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1571_c7_42cc]
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_8cfc]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1574_c7_9067]
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1574_c7_9067]
signal t8_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1574_c7_9067]
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_9067]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_9067]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_9067]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1574_c7_9067]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_9067]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_9067]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_3c0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1578_c7_2544]
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1578_c7_2544]
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_2544]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_2544]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1578_c7_2544]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_2544]
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_2544]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1580_c30_c8e8]
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1585_c11_1732]
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1585_c7_b49c]
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1585_c7_b49c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1585_c7_b49c]
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1585_c7_b49c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1585_c7_b49c]
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1588_c33_14e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_left,
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_right,
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6
n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- t8_MUX_uxn_opcodes_h_l1558_c2_bdc6
t8_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6
n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_left,
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_right,
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc
n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- t8_MUX_uxn_opcodes_h_l1571_c7_42cc
t8_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
t8_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc
n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1574_c7_9067
n16_low_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- t8_MUX_uxn_opcodes_h_l1574_c7_9067
t8_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
t8_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
t8_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
t8_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1574_c7_9067
n16_high_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1578_c7_2544
n16_low_MUX_uxn_opcodes_h_l1578_c7_2544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_cond,
n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue,
n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse,
n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1578_c7_2544
n16_high_MUX_uxn_opcodes_h_l1578_c7_2544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_cond,
n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue,
n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse,
n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8
sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_ins,
sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_x,
sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_y,
sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_left,
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_right,
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c
n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_cond,
n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue,
n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse,
n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output,
 n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output,
 n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 t8_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output,
 n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 t8_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output,
 n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_return_output,
 n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output,
 sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output,
 n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_916a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_8b3c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_71b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_80a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_9067_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_8063_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_4e4c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_6e68_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_dc61_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_2fd4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1574_l1571_DUPLICATE_33e6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1574_l1578_l1571_DUPLICATE_bf7d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1574_l1578_l1571_DUPLICATE_4559_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1553_l1593_DUPLICATE_5cb2_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_71b1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_71b1;
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_8b3c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_8b3c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_4e4c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_4e4c;
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_80a4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_80a4;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_916a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_916a;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1571_c11_1040] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_left;
     BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output := BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1585_c11_1732] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_left;
     BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output := BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1588_c33_14e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1558_c6_d581] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_left;
     BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output := BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_9067_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_dc61 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_dc61_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_3c0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_8cfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1582_c22_8063] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_8063_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l1580_c30_c8e8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_ins;
     sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_x;
     sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_return_output := sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1574_l1578_l1571_DUPLICATE_4559 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1574_l1578_l1571_DUPLICATE_4559_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_2fd4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_2fd4_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1574_l1571_DUPLICATE_33e6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1574_l1571_DUPLICATE_33e6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1574_l1578_l1571_DUPLICATE_bf7d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1574_l1578_l1571_DUPLICATE_bf7d_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_d581_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_1040_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_8cfc_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_3c0b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_1732_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_8063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1574_l1571_DUPLICATE_33e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1574_l1571_DUPLICATE_33e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1585_l1574_l1571_DUPLICATE_33e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_dc61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_dc61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_dc61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_dc61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1574_l1578_l1571_DUPLICATE_bf7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1574_l1578_l1571_DUPLICATE_bf7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1574_l1578_l1571_DUPLICATE_bf7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1585_l1574_l1578_l1571_DUPLICATE_bf7d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1574_l1578_l1571_DUPLICATE_4559_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1574_l1578_l1571_DUPLICATE_4559_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1574_l1578_l1571_DUPLICATE_4559_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_2fd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_2fd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_2fd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1585_l1574_l1558_l1571_DUPLICATE_2fd4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_bdc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_9067_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_c8e8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1585_c7_b49c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1585_c7_b49c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1588_c22_6e68] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_6e68_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_14e5_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1585_c7_b49c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_cond;
     n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output := n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1578_c7_2544] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1585_c7_b49c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     t8_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     t8_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := t8_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1578_c7_2544] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_cond;
     n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_return_output := n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_6e68_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1585_c7_b49c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_2544] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1578_c7_2544] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_cond;
     n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_return_output := n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;

     -- t8_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := t8_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_2544] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_2544] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_b49c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- t8_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_2544] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output := result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_2544_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_9067] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9067_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1571_c7_42cc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_42cc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1558_c2_bdc6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1553_l1593_DUPLICATE_5cb2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1553_l1593_DUPLICATE_5cb2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_bdc6_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1553_l1593_DUPLICATE_5cb2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1553_l1593_DUPLICATE_5cb2_return_output;
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
