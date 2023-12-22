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
-- BIN_OP_EQ[uxn_opcodes_h_l1575_c6_e48a]
signal BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal t8_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1575_c2_88b9]
signal n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_8228]
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal t8_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1588_c7_70cc]
signal n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_5f11]
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1591_c7_458f]
signal t8_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_458f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1591_c7_458f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1591_c7_458f]
signal result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1591_c7_458f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1591_c7_458f]
signal result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1591_c7_458f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1591_c7_458f]
signal n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1591_c7_458f]
signal n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1595_c11_962c]
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1595_c7_c4b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1595_c7_c4b3]
signal result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1595_c7_c4b3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1595_c7_c4b3]
signal result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1595_c7_c4b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1595_c7_c4b3]
signal n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1595_c7_c4b3]
signal n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1597_c30_6b97]
signal sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_22b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_eaa3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1602_c7_eaa3]
signal result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1602_c7_eaa3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1602_c7_eaa3]
signal result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1602_c7_eaa3]
signal n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1605_c33_76ac]
signal BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a
BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_left,
BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_right,
BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output);

-- t8_MUX_uxn_opcodes_h_l1575_c2_88b9
t8_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
t8_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9
result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9
result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9
result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9
result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9
result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9
n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9
n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_cond,
n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue,
n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse,
n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_left,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_right,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output);

-- t8_MUX_uxn_opcodes_h_l1588_c7_70cc
t8_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
t8_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc
result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc
result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc
n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc
n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_cond,
n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue,
n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse,
n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_left,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_right,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output);

-- t8_MUX_uxn_opcodes_h_l1591_c7_458f
t8_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
t8_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
t8_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
t8_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f
result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f
result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f
result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1591_c7_458f
n16_low_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1591_c7_458f
n16_high_MUX_uxn_opcodes_h_l1591_c7_458f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_cond,
n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue,
n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse,
n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_left,
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_right,
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3
result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3
result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3
result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3
n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond,
n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue,
n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse,
n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3
n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond,
n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue,
n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse,
n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97
sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_ins,
sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_x,
sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_y,
sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3
result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3
result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3
n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond,
n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue,
n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse,
n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac
BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_left,
BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_right,
BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output,
 t8_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output,
 t8_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output,
 t8_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output,
 n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output,
 n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output,
 n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_8a12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1580_c3_fd00 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_09d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_adc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1591_c7_458f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1599_c22_493f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1604_c3_d046 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1605_c22_823a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_e8ed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_d649_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1595_DUPLICATE_34cd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1588_l1591_l1595_DUPLICATE_798a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1588_l1602_l1591_DUPLICATE_47c6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1610_l1570_DUPLICATE_81ce_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_8a12 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_8a12;
     VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_adc1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_adc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1580_c3_fd00 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1580_c3_fd00;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1604_c3_d046 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1604_c3_d046;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_09d3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_09d3;
     VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_8228] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_left;
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output := BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1588_l1591_l1595_DUPLICATE_798a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1588_l1591_l1595_DUPLICATE_798a_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_e8ed LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_e8ed_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1605_c33_76ac] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1595_DUPLICATE_34cd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1595_DUPLICATE_34cd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_5f11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_left;
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output := BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_22b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1597_c30_6b97] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_ins;
     sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_x;
     sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_return_output := sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1595_c11_962c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_d649 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_d649_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1588_l1602_l1591_DUPLICATE_47c6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1588_l1602_l1591_DUPLICATE_47c6_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1591_c7_458f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1575_c6_e48a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1599_c22_493f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1599_c22_493f_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c6_e48a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_8228_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_5f11_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_962c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_22b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1599_c22_493f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1588_l1602_l1591_DUPLICATE_47c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1588_l1602_l1591_DUPLICATE_47c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1588_l1602_l1591_DUPLICATE_47c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_d649_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_d649_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_d649_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_d649_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1595_DUPLICATE_34cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1595_DUPLICATE_34cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1595_DUPLICATE_34cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1595_DUPLICATE_34cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1588_l1591_l1595_DUPLICATE_798a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1588_l1591_l1595_DUPLICATE_798a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1588_l1591_l1595_DUPLICATE_798a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_e8ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_e8ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_e8ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1588_l1602_l1591_l1575_DUPLICATE_e8ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1575_c2_88b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1591_c7_458f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1597_c30_6b97_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1595_c7_c4b3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     t8_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     t8_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := t8_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1605_c22_823a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1605_c22_823a_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1605_c33_76ac_return_output);

     -- n16_high_MUX[uxn_opcodes_h_l1595_c7_c4b3] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond;
     n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output := n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_eaa3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1602_c7_eaa3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1602_c7_eaa3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond;
     n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output := n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1602_c7_eaa3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1605_c22_823a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1595_c7_c4b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := t8_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1595_c7_c4b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1595_c7_c4b3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond;
     n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output := n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1602_c7_eaa3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1595_c7_c4b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1602_c7_eaa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1595_c7_c4b3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := t8_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1595_c7_c4b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1591_c7_458f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1591_c7_458f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1588_c7_70cc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1588_c7_70cc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1575_c2_88b9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1610_l1570_DUPLICATE_81ce LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1610_l1570_DUPLICATE_81ce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1575_c2_88b9_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1610_l1570_DUPLICATE_81ce_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1610_l1570_DUPLICATE_81ce_return_output;
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
