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
-- BIN_OP_EQ[uxn_opcodes_h_l1558_c6_5b32]
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal t8_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1558_c2_76c5]
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1571_c11_5f10]
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1571_c7_0256]
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1571_c7_0256]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1571_c7_0256]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1571_c7_0256]
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1571_c7_0256]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1571_c7_0256]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1571_c7_0256]
signal t8_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1571_c7_0256]
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1571_c7_0256]
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_16da]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal t8_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1574_c7_05cf]
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_eddd]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_8ae9]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1578_c7_8ae9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_8ae9]
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_8ae9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_8ae9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1578_c7_8ae9]
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1578_c7_8ae9]
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1580_c30_0c84]
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1585_c11_24c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1585_c7_2bf5]
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1585_c7_2bf5]
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1585_c7_2bf5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1585_c7_2bf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1585_c7_2bf5]
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1588_c33_eda0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
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
-- BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_left,
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_right,
BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- t8_MUX_uxn_opcodes_h_l1558_c2_76c5
t8_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
t8_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5
n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5
n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_cond,
n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue,
n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse,
n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_left,
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_right,
BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- t8_MUX_uxn_opcodes_h_l1571_c7_0256
t8_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
t8_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
t8_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
t8_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1571_c7_0256
n16_low_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1571_c7_0256
n16_high_MUX_uxn_opcodes_h_l1571_c7_0256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_cond,
n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue,
n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse,
n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- t8_MUX_uxn_opcodes_h_l1574_c7_05cf
t8_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
t8_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf
n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf
n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_cond,
n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue,
n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse,
n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9
n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond,
n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue,
n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse,
n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9
n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond,
n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue,
n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse,
n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84
sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_ins,
sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_x,
sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_y,
sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5
n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond,
n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue,
n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse,
n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 t8_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 t8_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 t8_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output,
 n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output,
 n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output,
 n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_70fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_b594 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_fc72 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_ece0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_05cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_1e11_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_fbb7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_d914_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_d63c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_a88f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1571_l1574_l1578_DUPLICATE_5f79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_e34d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1578_DUPLICATE_c3f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1553_l1593_DUPLICATE_f04f_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_fbb7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1587_c3_fbb7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_ece0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_ece0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_fc72 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_fc72;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_b594 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1563_c3_b594;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_70fe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1568_c3_70fe;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_d63c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_d63c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1571_c11_5f10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1582_c22_1e11] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_1e11_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1578_DUPLICATE_c3f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1578_DUPLICATE_c3f9_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1580_c30_0c84] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_ins;
     sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_x;
     sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_return_output := sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_e34d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_e34d_return_output := result.sp_relative_shift;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_05cf_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_eddd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1558_c6_5b32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_left;
     BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output := BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1571_l1574_l1578_DUPLICATE_5f79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1571_l1574_l1578_DUPLICATE_5f79_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_16da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1588_c33_eda0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_a88f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_a88f_return_output := result.u16_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1585_c11_24c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c6_5b32_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1571_c11_5f10_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_16da_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_eddd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1585_c11_24c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1582_c22_1e11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_e34d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_e34d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1571_l1585_l1574_DUPLICATE_e34d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_a88f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_a88f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_a88f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_a88f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1578_DUPLICATE_c3f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1578_DUPLICATE_c3f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1578_DUPLICATE_c3f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1578_DUPLICATE_c3f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1571_l1574_l1578_DUPLICATE_5f79_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1571_l1574_l1578_DUPLICATE_5f79_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1571_l1574_l1578_DUPLICATE_5f79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_d63c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_d63c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_d63c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1571_l1585_l1574_l1558_DUPLICATE_d63c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1558_c2_76c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_c7_05cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1580_c30_0c84_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1578_c7_8ae9] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond;
     n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output := n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1585_c7_2bf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1588_c22_d914] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_d914_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1588_c33_eda0_return_output);

     -- n16_low_MUX[uxn_opcodes_h_l1585_c7_2bf5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond;
     n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output := n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := t8_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1585_c7_2bf5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1585_c7_2bf5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1578_c7_8ae9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1588_c22_d914_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_8ae9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1578_c7_8ae9] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond;
     n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output := n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_8ae9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_8ae9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     t8_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     t8_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := t8_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1585_c7_2bf5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1585_c7_2bf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- t8_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := t8_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_8ae9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_8ae9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_05cf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_05cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1571_c7_0256] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output := result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1571_c7_0256_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1558_c2_76c5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1553_l1593_DUPLICATE_f04f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1553_l1593_DUPLICATE_f04f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c2_76c5_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1553_l1593_DUPLICATE_f04f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1553_l1593_DUPLICATE_f04f_return_output;
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
