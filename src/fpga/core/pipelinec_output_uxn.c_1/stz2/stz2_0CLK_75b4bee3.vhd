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
-- BIN_OP_EQ[uxn_opcodes_h_l1558_c6_135a]
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1558_c2_ad0e]
signal t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1571_c11_c755]
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1571_c7_e8b4]
signal t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_3a73]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1574_c7_9185]
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1574_c7_9185]
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_9185]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_9185]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_9185]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_9185]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1574_c7_9185]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_9185]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1574_c7_9185]
signal t8_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_632b]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1578_c7_a7d0]
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1578_c7_a7d0]
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_a7d0]
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_a7d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_a7d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1578_c7_a7d0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_a7d0]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1580_c30_3a23]
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1585_c11_704b]
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1585_c7_1054]
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1585_c7_1054]
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1585_c7_1054]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1585_c7_1054]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1585_c7_1054]
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1588_c33_b0d3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a906( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_left,
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_right,
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e
n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e
n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- t8_MUX_uxn_opcodes_h_l1558_c2_ad0e
t8_MUX_uxn_opcodes_h_l1558_c2_ad0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond,
t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue,
t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse,
t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_left,
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_right,
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4
n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4
n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- t8_MUX_uxn_opcodes_h_l1571_c7_e8b4
t8_MUX_uxn_opcodes_h_l1571_c7_e8b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond,
t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue,
t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse,
t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1574_c7_9185
n16_low_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1574_c7_9185
n16_high_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- t8_MUX_uxn_opcodes_h_l1574_c7_9185
t8_MUX_uxn_opcodes_h_l1574_c7_9185 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1574_c7_9185_cond,
t8_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue,
t8_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse,
t8_MUX_uxn_opcodes_h_l1574_c7_9185_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0
n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond,
n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue,
n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse,
n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0
n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond,
n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue,
n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse,
n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23
sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_ins,
sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_x,
sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_y,
sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_left,
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_right,
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1585_c7_1054
n16_low_MUX_uxn_opcodes_h_l1585_c7_1054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_cond,
n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue,
n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse,
n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output,
 n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output,
 n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output,
 n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 t8_MUX_uxn_opcodes_h_l1574_c7_9185_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output,
 n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output,
 n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output,
 n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_5d38 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_ed67 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_318f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0161 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_9185_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_5868_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_4dd4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_a14d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_b3f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_522e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_0a21_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1578_l1571_l1585_l1574_DUPLICATE_7d17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1578_l1571_l1574_DUPLICATE_7547_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1593_l1553_DUPLICATE_bb2d_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_ed67 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_ed67;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0161 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0161;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_5d38 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_5d38;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_318f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_318f;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_4dd4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_4dd4;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1588_c33_b0d3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_0a21 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_0a21_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1578_l1571_l1585_l1574_DUPLICATE_7d17 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1578_l1571_l1585_l1574_DUPLICATE_7d17_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_9185_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_3a73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1571_c11_c755] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_left;
     BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output := BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1580_c30_3a23] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_ins;
     sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_x;
     sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_return_output := sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_b3f8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_b3f8_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_522e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_522e_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1578_l1571_l1574_DUPLICATE_7547 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1578_l1571_l1574_DUPLICATE_7547_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_632b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1585_c11_704b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1582_c22_5868] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_5868_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1558_c6_135a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_135a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_c755_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3a73_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_632b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_704b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_5868_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_0a21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_0a21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_0a21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_b3f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_b3f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_b3f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_b3f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1578_l1571_l1585_l1574_DUPLICATE_7d17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1578_l1571_l1585_l1574_DUPLICATE_7d17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1578_l1571_l1585_l1574_DUPLICATE_7d17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1578_l1571_l1585_l1574_DUPLICATE_7d17_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1578_l1571_l1574_DUPLICATE_7547_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1578_l1571_l1574_DUPLICATE_7547_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1578_l1571_l1574_DUPLICATE_7547_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_522e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_522e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_522e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1558_l1571_l1585_l1574_DUPLICATE_522e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_ad0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_9185_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_3a23_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1578_c7_a7d0] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond;
     n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output := n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1585_c7_1054] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output := result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1585_c7_1054] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1585_c7_1054] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1588_c22_a14d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_a14d_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_b0d3_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1578_c7_a7d0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     t8_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     t8_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := t8_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1585_c7_1054] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_cond;
     n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_return_output := n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_a14d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1578_c7_a7d0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond;
     n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output := n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_a7d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_a7d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_a7d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1585_c7_1054] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output := result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_1054_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_a7d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_a7d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_9185] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_9185_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1571_c7_e8b4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_e8b4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1558_c2_ad0e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1593_l1553_DUPLICATE_bb2d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1593_l1553_DUPLICATE_bb2d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_ad0e_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1593_l1553_DUPLICATE_bb2d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1593_l1553_DUPLICATE_bb2d_return_output;
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
